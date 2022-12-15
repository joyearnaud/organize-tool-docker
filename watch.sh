while true; do
  ls -d Input/* | entr -d echo "test"
done