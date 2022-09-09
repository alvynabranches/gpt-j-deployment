FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip setuptools --no-warn-script-location
RUN python3 -m pip install torch torchvision torchaudio transformers flask --extra-index-url https://download.pytorch.org/whl/cu116 --no-warn-script-location
RUN python3 -c 'from transformers import AutoTokenizer; AutoTokenizer.from_pretrained("EleutherAI/gpt-j-6B")'

WORKDIR /app
COPY ltm_model/ model/
COPY ltm.py main.py

ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE ${PORT}

CMD [ "python3", "main.py" ]