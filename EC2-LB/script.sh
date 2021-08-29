#!/bin/bash
sudo apt update -y 
sudo apt install docker docker.io -y
cd /home/ubuntu/src
sudo docker build -t pyimg .
sudo docker run -d --name pythonapp-p 5000:5000 pyimg 
sudo docker run -d --name pythonapp -p 80:5000 pyimg
