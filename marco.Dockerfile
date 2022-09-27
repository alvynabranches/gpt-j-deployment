FROM gcr.io/gpt-j-and-gpt-neox20b/marco:base

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade requirements.txt
COPY main.py main.py

ENV MODEL_NAME=marco
ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE 5000

CMD [ "python3", "main.py" ]
