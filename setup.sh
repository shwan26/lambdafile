#!/bin/bash
#the two lines below are new for Amazon Linux2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
pip install boto3

echo Please wait...
#sudo pip install --upgrade awscli
bucket="sm-bucket0"
apigateway="6twypxsnb3"
FILE_PATH="/home/cloudshell-user/resources/public_policy.json"
FILE_PATH_2="/home/cloudshell-user/resources/permissions.py"
FILE_PATH_3="/home/cloudshell-user/resources/resources/setup.sh"
sed -i "s/<FMI_1>/$bucket/g" $FILE_PATH
sed -i "s/<FMI>/$bucket/g" $FILE_PATH_2

aws s3 cp resources/website s3://$bucket/ --recursive --cache-control "max-age=0"

python /home/cloudshell-user/resources/permissions.py
python /home/cloudshell-user/resources/seed.py

