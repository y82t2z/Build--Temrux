mkdir clang
cd clang
wget -i <(wget -qO- https://raw.githubusercontent.com/ZyCromerZ/Clang/refs/heads/main/Clang-main-link.txt) -O clang.tar.gz
tar -xvf clang.tar.gz
echo "Downloaded Clang Successful"
cd ../