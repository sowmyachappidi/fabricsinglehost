echo "================================================================================================="

echo "changing the directory to ordererorg"
cd ../../setup1/ordererorg/

echo "truning on orderer-org"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org1"
cd ../org1/

echo "truning on org1"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org2"
cd ../org2/

echo "truning on org2"
docker-compose up -d


echo "================================================================================================="

echo "changing the directory to org3"
cd ../org3/

echo "truning on org3"
docker-compose up -d


echo "================================================================================================="