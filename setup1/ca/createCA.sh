echo "================================================================================================="

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
docker-compose down

echo "================================================================================================="

echo "change directory to org1 ca folder"
cd ../../org1/create-certificate-with-ca

echo "turn on ca for org1"
docker-compose up -d
sleep 30

echo "removing old crypto config for org1"
rm -rf ../crypto-config

echo "create crypto material for org1"
./create-certificate-with-ca.sh

echo "turn off ca for org1"
docker-compose down

echo "================================================================================================="

echo "change directory to org2 ca folder"
cd ../../org2/create-certificate-with-ca

echo "turn on ca for org2"
docker-compose up -d
sleep 30

echo "removing old crypto config for org2"
rm -rf ../crypto-config

echo "create crypto material for org2"
./create-certificate-with-ca.sh

echo "turn off ca for org2"
docker-compose down

echo "================================================================================================="

echo "change directory to org3 ca folder"
cd ../../org3/create-certificate-with-ca

echo "turn on ca for org3"
docker-compose up -d
sleep 30

echo "removing old crypto config for org3"
rm -rf ../crypto-config

echo "create crypto material for org3"
./create-certificate-with-ca.sh

echo "turn off ca for org3"
docker-compose down 

echo "================================================================================================="

