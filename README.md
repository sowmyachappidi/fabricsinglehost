# FabricMultiHostDeployment

### 3 ORGS and 1 ORDERER ORG ARCHITECTURE

![architecture](https://user-images.githubusercontent.com/47631184/173664134-e1f9c6bc-92a3-4870-ac9e-9f7891c9433f.svg)



### RUN NETWORK AND INVOKE SAMPLE CHAINCODE AS PER ABOVE ARCHITECTURE

![run_network](https://user-images.githubusercontent.com/47631184/173658783-2f87d028-e75b-451e-a5eb-66dbeac177e0.svg)


#### Step-1 : 0_clean_images.sh
goto setup1/network_automation_scripts and run 0_clean_images.sh
Description: it will **stop and remove** all the running docker containers

#### Step-2 : 1_createCA.sh
goto setup1/network_automation_scripts then run 1_createCA.sh
Description: It will create CA's for all the Organizations. As part of CA's creation it will generate msp and tls certificates to all the peers.

#### Step-3 : 2_createGenesis.sh
goto setup1/network_automation_scripts then run 2_createGenesis.sh
Description: It will generate a genesis file which is called as block 0. It contains the starting transaction that is the information of the nodes

#### Step-4 : 3_startNetwork.sh
goto setup1/network_automation_scripts then run 3_startNetwork.sh
Description: It will start the network with 3 peer organizations and 1 orderer organization.

#### Step-5 : 4_createChannel.sh
goto setup1/network_automation_scripts then run 4_createChannel.sh
Description: It will first go to Org1 then create a channel, join channel and update anchor peer in org1. Next step in Org2 it will fetch, join and update anchor peers in org2 and then similarly in org3.

#### Step-6 : 5_createAndApproveChaincode.sh
goto setup1/network_automation_scripts then run 5_createAndApproveChaincode.sh
Description: In this script, first in org1, it will package the chaincode, install the chaincode, query&approve chaincode, check commit readyness. after that again the same process will be done in org2 and org3.

#### Step-7 : 6_CLI_Container_Commit.txt
goto org1 and run the command: docker exec -it cli bash
Then copy the content from CLI_Container_Commit.txt file and paste it in editor then press enter to execute the script for commit and invoke the chaincode and to query the chaincode.

### ADD NEW ORG (ORG-4)

![addorg (1)](https://user-images.githubusercontent.com/47631184/173661828-32bd6d1e-69a0-42eb-9b89-f2efa089fa3b.svg)


### 4 ORGS and 1 ORDERER ORG ARCHITECTURE

added new arg (ORG-4 and one orderer)
![udpatedarchitecture drawio](https://user-images.githubusercontent.com/47631184/173665240-0cbea65b-cea9-488d-9ce5-560b565512df.svg)

