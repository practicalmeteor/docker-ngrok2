#!/bin/sh

# Override ngrok.yml with home ngrok
cp ~/.ngrok2/ngrok.yml ./add/home/ngrok/.ngrok2/
if [ $? -eq 0 ]; then
    echo Using ngrok.yml from ~/.ngrok2/
else
  # TODO: Check if ngrok.yml doesn't exist locally in repo root, and print error and exit if it doesn't
  # TODO: Copy from root of repo to /add/home/ngrok ...
    echo Using ngrok.yml from .
fi

# Build docker container image
sudo docker build -t practicalmeteor/ngrok2 .
