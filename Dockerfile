FROM python:3.10

RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install torch torchvision torchaudio transformers flask --no-warn-script-location
RUN python3 -c 'from transformers import GPTJForCausalLM, AutoTokenizer; GPTJForCausalLM.from_pretrained("EleutherAI/gpt-j-6B"); AutoTokenizer.from_pretrained("EleutherAI/gpt-j-6B")'

WORKDIR /app
COPY . .

ENV HOST "0.0.0.0"
ENV PORT 5000
ENV DEBUG "true"

CMD [ "python3", "main.py"]