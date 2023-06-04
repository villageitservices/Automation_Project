#! /bin/sh
sudo apt update -y
sudo apt-get install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
timestamp=$(date '+%d%m%Y-%H%M%S')
name='srinivas'
bucket='upgrad-srinivas-villageit'
tar -cvf ${name}-httpd-logs-${timestamp}.tar /var/log/apache2/*.log
mv ${name}-httpd-logs-${timestamp}.tar /tmp/.
aws s3 \
cp /tmp/${name}-httpd-logs-${timestamp}.tar \
s3://${bucket}/${name}-httpd-logs-${timestamp}.tar

