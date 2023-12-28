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

python3 -m venv venv_lama

source venv_lama/bin/activate

git clone https://github.com/jahangir091/lama-custom.git

cd lama-custom

pip install .

#python main.py --model=lama --device=cuda --host=0.0.0.0 --port=8005