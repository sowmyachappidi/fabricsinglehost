echo "================= Change Directory started ================= "
cd 
pwd
echo "=================  Directory Changed ================= "

echo "================= Download Fabric Binaries started ================= "
curl -sSL https://bit.ly/2ysbOFE | bash -s
echo "=================  Download Fabric Binaries    Ended ================= "

echo ""
echo ""

echo "================= View Docker images  started================= "
docker images
echo "=================  View Docker images   Ended ================= "



