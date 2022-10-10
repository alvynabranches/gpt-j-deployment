FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip setuptools --no-warn-script-location
RUN python3 -m pip install torch torchvision torchaudio transformers --extra-index-url https://download.pytorch.org/whl/cu116 --no-warn-script-location
RUN python3 -c 'from transformers import AutoTokenizer; AutoTokenizer.from_pretrained("EleutherAI/gpt-j-6B")'
RUN python3 -m pip install -r requirements.txt
