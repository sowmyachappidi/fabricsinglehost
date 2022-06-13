echo "======================================================================================"
echo "CHANNEL CREATION STARTED"
echo "create channel started A1_createChannel.sh"
cd ../org1/
./A1_createChannel.sh
sleep 10
./A2_joinChannel.sh
sleep 10
./A3_updateAnchorPeers.sh
sleep 10

cd ../org2/
./A1_fetchChannelBlock.sh
sleep 10
./A2_joinChannel.sh
sleep 10
./A3_updateAnchorPeers.sh
sleep 10

cd ../org3/
./A1_fetchChannelBlock.sh
sleep 10
./A2_joinChannel.sh
sleep 10
./A3_updateAnchorPeers.sh
sleep 10
