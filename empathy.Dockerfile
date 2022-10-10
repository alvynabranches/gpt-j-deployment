FROM gcr.io/gpt-j-and-gpt-neox20b/jax:base

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
VOLUME /app/model/

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade -r requirements.txt
COPY main.py main.py

ENV MODEL_NAME=empathy
EXPOSE 5000

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000" ]
