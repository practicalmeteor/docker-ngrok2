#!/bin/sh

# Override ngrok.yml with home ngrok
cp ~/.ngrok2/ngrok.yml ./add/home/ngrok/.ngrok2/
if [ $? -eq 0 ]; then
    echo Using ngrok.yml from ~/.ngrok2/
else
    echo Using ngrok.yml from .
fi

# Build docker container image
sudo docker build -t practicalmeteor/ngrok2 .
