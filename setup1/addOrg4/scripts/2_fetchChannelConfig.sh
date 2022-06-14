export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/../../ordererorg/crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=${PWD}/../../org1/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/../../org2/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export PEER0_ORG3_CA=${PWD}/../../org3/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt
export PEER0_ORG4_CA=${PWD}/../../addOrg4/crypto-config/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/../../../artifacts/channel/config/

export CHANNEL_NAME=mychannel

setGlobalsForOrderer() {
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../../ordererorg/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../../ordererorg/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp

}

setGlobalsForPeer0Org1() {
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../../org1/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer0Org2() {
    export CORE_PEER_LOCALMSPID="Org2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../../org2/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:9051

}

setGlobalsForPeer0Org3() {
    export CORE_PEER_LOCALMSPID="Org3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../../org3/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:9051

}

setGlobalsForPeer0Org4() {
    export CORE_PEER_LOCALMSPID="Org4MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG4_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}../../addOrg4/crypto-config/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp
    export CORE_PEER_ADDRESS=localhost:11051

}


fetchChannelConfig() {
    setGlobalsForOrderer
    setGlobalsForPeer0Org1

    # Fetch the config for the channel, writing it to config.json
    echo " Step 2.1 Fetching the most recent configuration block for the channel"
    set -x
     peer channel fetch config config_block.pb -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        -c $CHANNEL_NAME --tls --cafile $ORDERER_CA
    set +x

    # echo "Decoding config block to JSON and isolating config to config.json"
    echo "Step 2.2 Decoding config block to JSON and isolating config to config.json"
    set -x
    configtxlator proto_decode --input config_block.pb --type common.Block | jq .data.data[0].payload.data.config >config.json
    set +x

    # Modify the configuration to append the new org
    echo "Step 2.3 Modify the configuration to append the new org"
    set -x
    jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups": {"Org4MSP":.[1]}}}}}' config.json ./org4.json >modified_config.json
    set +x

}

fetchChannelConfig
