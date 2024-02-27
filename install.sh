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

# pip install -U xformers --index-url https://download.pytorch.org/whl/cu121

cp lama_object_remove_python.service /etc/systemd/system/
cp lama_object_remove_python.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable lama_object_remove_python
service lama_object_remove_python start

cp lama_object_remove_nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/lama_object_remove_ngix.conf /etc/nginx/sites-enabled/
service nginx restart
#python main.py --model=lama --device=cuda --host=0.0.0.0 --port=8005
#python main.py --model=realisticVision1.4 --device=cuda --host=0.0.0.0 --port=8007 --enable-xformers
#python main.py --model=lama --device=cuda --host=0.0.0.0 --port=8006 --enable-remove-bg --enable-realesrgan --realesrgan-device=cuda --realesrgan-no-half --enable-restoreformer --restoreformer-device=cuda --enable-gfpgan --gfpgan-device=cuda
