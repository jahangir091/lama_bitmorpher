#!/usr/bin/env bash

apt update
apt upgrade

conda remove ffmpeg -y

apt install libgl1 libglib2.0-0 ffmpeg gcc build-essential nginx -y
apt install software-properties-common
apt install python3-launchpadlib
apt update

#add-apt-repository ppa:deadsnakes/ppa -y

#apt install python3.10 -y

cd
cd /home/
git clone https://github.com/jahangir091/lama_bitmorpher.git
cd lama_bitmorpher

python3 -m venv .venv
source .venv/bin/activate

pip install .

cp lama_object_remove_python.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable myservice
service lama_object_remove_python start

cp lama_object_remove_ngix.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/lama_object_remove_ngix.conf /etc/nginx/sites-enabled/
service nginx restart
#python main.py --model=lama --device=cuda --host=0.0.0.0 --port=8005