#!/bin/sh

# Override ngrok.yml with home ngrok
cp ~/.ngrok2/ngrok.yml .
if [ $? -eq 0 ]; then
    echo Using ngrok.yml from ~/.ngrok2/
else
    echo Using ngrok.yml from .
fi

# Build docker container image
docker build -t practicalmeteor/ngrok2 .
