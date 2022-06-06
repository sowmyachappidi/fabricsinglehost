echo "================================================================================================="

echo "stopping docker containers"
docker stop $(docker ps -aq)

echo "removing  docker containers"
docker rm $(docker ps -aq)

echo "================================================================================================="
