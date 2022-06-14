cd ../org1/
./B1_presetup.sh
sleep 10
./B2_packageChaincode.sh
sleep 10
./B3_installChaincode.sh
sleep 15
./B4_query_and_approve_cc.sh
sleep 10
./B5_checkCommitReadyness.sh
sleep 5


cd ../org2/
./B1_presetup.sh
sleep 10
./B2_packageChaincode.sh
sleep 10
./B3_installChaincode.sh
sleep 15
./B4_query_and_approve_cc.sh
sleep 10
./B5_checkCommitReadyness.sh
sleep 5


cd ../org3/
./B1_presetup.sh
sleep 10
./B2_packageChaincode.sh
sleep 10
./B3_installChaincode.sh
sleep 15
./B4_query_and_approve_cc.sh
sleep 10
./B5_checkCommitReadyness.sh
sleep 5
