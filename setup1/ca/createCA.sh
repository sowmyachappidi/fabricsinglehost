echo "================================================================================================="

echo "stop docker"
docker stop $(docker ps -aq)

echo "remove docker"
docker rm $(docker ps -aq)

echo "change directory to orderer ca folder"
cd ../ordererorg/create-certificate-with-ca

echo "turn on ca for ordererorg"
docker-compose up -d
sleep 30

echo "removing old crypto config for ordereorg"
rm -rf ../crypto-config

echo "create crypto material for ordererorg"
./create-certificate-with-ca.sh

echo "turn off ca for ordererorg"
#docker-compose down

echo "================================================================================================="

echo "turn on ca for org1"
docker-compose up -d

echo "create crypto material for org1"
./create-certificate-with-ca.sh

echo "turn off ca for org1"
#docker-compose down

echo "================================================================================================="


docker-compose up -d
echo "change directory to org2 ca folder"
cd ../../org2/create-certificate-with-ca

echo "turn on ca for org2"
docker-compose up -d

echo "create crypto material for org2"
./create-certificate-with-ca.sh

echo "turn off ca for org2"
#docker-compose down

echo "================================================================================================="
docker-compose up -d
echo "change directory to org3 ca folder"
cd ../../org3/create-certificate-with-ca

echo "turn on ca for org3"
docker-compose up -d

echo "create crypto material for org3"
./create-certificate-with-ca.sh

echo "turn off ca for org3"
#docker-compose down 

echo "================================================================================================="

echo "creating gensis file for the created crypto"
cd ../../../artifacts/channel/
./create-artifacts.sh

echo "================================================================================================="

echo "changing the directory to ordererorg"
cd ../../setup1/ordererorg/

echo "truning on ordererorg"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org1"
cd ../setup1/org1/

echo "truning on org1"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org2"
cd ../setup1/org2/

echo "truning on org2"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org3"
cd ../setup1/org3/

echo "truning on org3"
docker-compose up -d


echo "================================================================================================="