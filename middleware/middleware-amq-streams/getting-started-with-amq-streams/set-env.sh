echo "Preparing initials..." && 
wget https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.12.0/strimzi-0.12.0.tar.gz > /dev/null 2>&1 && 
tar -zxvf strimzi-0.12.0.tar.gz > /dev/null 2>&1 && 
rm -rf strimzi-0.12.0.tar.gz > /dev/null 2>&1 && 
cd strimzi-0.12.0 > /dev/null 2>&1 && 
echo "Initials ready."