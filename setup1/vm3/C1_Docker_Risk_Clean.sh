
echo "================= stop all docker containers  started ================= "
docker stop $(docker ps -aq)
echo "=================  stop all docker containers  Ended ================= "

echo "================= remove all docker containers  started ================= "
docker rm $(docker ps -aq)
echo "=================  remove all docker containers  Ended ================= "

echo "=================  remove all docker images  Started ================= "
docker  rmi $(docker images -aq) -f
echo "=================  remove all docker images  Ended ================= "

echo "=================  docker prune Started ================= "
docker system prune -a -y
echo "=================  docker prune Ended ================= "

echo "=================  Leave Docker swarn group Started ================= "
docker swarm leave -f
echo "=================  Leave Docker swarn group Ended ================= "



echo "=================  Docker network prune Started ================= "
docker network prune -f
echo "=================  Docker network prune Ended ================= "


echo "=================  Available Containers ================= "
echo ""
docker ps -a

echo "=================  Available Images ================= "
echo ""
docker images

echo "=================  Available Networks ================= "
echo ""
docker network ls
