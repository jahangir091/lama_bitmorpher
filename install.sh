#!/usr/bin/env bash

apt update
apt upgrade

conda remove ffmpeg -y

apt install libgl1 libglib2.0-0 ffmpeg gcc build-essential nginx -y

add-apt-repository ppa:deadsnakes/ppa

apt install python3.10 -y

python3.10 -m venv venv

source venv/bin/activate

pip install .

python main.py --model=lama --device=cuda --host=0.0.0.0 --port=8005