#!/bin/bash

mkdir /home/ubuntu/ravi/
touch /home/ubuntu/ravi/Dockerfile
cd /home/ubuntu/ravi/

echo "FROM alpine:latest" >> Dockerfile
echo "#feeding REDIS_URL through environmental" >> Dockerfile
echo "ENV REDIS_URL=redis://hostname:6379" >> Dockerfile
echo "RUN apk update && apk add wget ca-certificates && cd /sbin && wget https://s3.amazonaws.com/ml-sreracha/sreracha" >> Dockerfile
echo "#Giving permissions to the application" >> Dockerfile
echo "RUN chmod 755 /sbin/sreracha" >> Dockerfile
echo "EXPOSE 80" >> Dockerfile
echo "#running as root" >> Dockerfile
echo "USER root" >> Dockerfile
echo "ENTRYPOINT /sbin/sreracha" >> Dockerfile

sudo apt-get update
sudo apt-get -y install docker
sudo apt-get -y install docker.io
sudo docker run -d --name redis-server -p 6379:6379 sickp/alpine-redis 
sudo docker build -t ubuntu/ravi .
sudo docker run -d -p 80:80 --name ravi ubuntu/ravi
sudo apt-get install -y apache2
sudo apt-get install -y apache2-bin
sudo service apache2 start
sudo curl http://$(hostname -i) -vv
