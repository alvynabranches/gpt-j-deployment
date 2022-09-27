FROM gcr.io/gpt-j-and-gpt-neox20b/ltm:base

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade -r requirements.txt
COPY main.py main.py

ENV MODEL_NAME=ltm
ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE 5000

CMD [ "python3", "main.py" ]
