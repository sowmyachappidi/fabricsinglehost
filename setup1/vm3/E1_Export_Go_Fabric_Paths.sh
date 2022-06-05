
echo "================= Export Go Path  started ================= "
export PATH=$PATH:/usr/local/go/bin
go version
echo "=================  sExport Go Path    Ended ================= "

echo ""
echo ""

echo "================= Export Fabric Binaries Path  started================= "
export PATH=$PATH:/home/ubuntu/fabric-samples/bin
peer
echo "=================  Export Fabric Binaries Path   Ended ================= "



