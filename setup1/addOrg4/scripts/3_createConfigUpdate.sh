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


createConfigUpdate() {

    CHANNEL="mychannel"
    ORIGINAL="config.json"
    MODIFIED="modified_config.json"
    OUTPUT="org4_update_in_envelope.pb"

    set -x
    
    echo "Step 3.1 Encode Original Config"
    configtxlator proto_encode --input "${ORIGINAL}" --type common.Config >original_config.pb
    
    echo "Step 3.2 Encode Modified Config"
    configtxlator proto_encode --input "${MODIFIED}" --type common.Config >modified_config.pb
    
    echo "Step 3.3  Compute Update"
    configtxlator compute_update --channel_id "${CHANNEL}" --original original_config.pb --updated modified_config.pb >config_update.pb
    
    echo "Step 3.4 Config Update"
    configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate >config_update.json
    
    echo "Step 3.5 Config update Envolope"
    echo '{"payload":{"header":{"channel_header":{"channel_id":"'$CHANNEL'", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . >config_update_in_envelope.json
    
    echo "Step 3.6 Envolope"
    configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope >"${OUTPUT}"
    
    set +x

}

createConfigUpdate
