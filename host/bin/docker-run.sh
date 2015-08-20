#!/bin/sh

sudo docker run -d --net=host --name=ngrok $@ practicalmeteor/ngrok2
