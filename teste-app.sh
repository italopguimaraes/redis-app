#/bin/bash
sudo yum install -y wget
RESULT="'wget -qO- http://localhost:8090'"
echo 'RESULT:'
echo $RESULT
wget -q localhost:8090
if [ $? -eq 0 ]
then
    echo 'ok - serviço no ar'
elif [[ $RESULT == *"Number"* ]]
then
    echo "ok-number of visits"
    echo $RESULT
else
    echo "erro! number of visits"
    exit 1
fi
