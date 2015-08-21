#!/bin/sh

# Override ngrok.yml with home ngrok
cp ./ngrok.yml ./add/home/ngrok/.ngrok2/
if [ $? -eq 1 ];
then
    echo Ngrok config file ./ngrok.yml not found in docker root dir.
    exit 1
fi

# Build docker container image
sudo docker build -t practicalmeteor/ngrok2 .
