#!/bin/sh

# TODO: Run detached from console
# TODO: Append $@ so any arguments will be passwed through
# TODO: Add name / alias - call it ngrok
sudo docker run -d --net=host -name=ngrok practicalmeteor/ngrok2
