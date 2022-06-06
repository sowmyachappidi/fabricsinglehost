
echo "================= stop all docker containers  started ================= "
docker stop $(docker ps -aq)
echo "=================  stop all docker containers  Ended ================= "

echo "================= remove all docker containers  started ================= "
docker rm $(docker ps -aq)
echo "=================  remove all docker containers  Ended ================= "

echo "=================  Available Containers ================= "
echo ""
docker ps -a


