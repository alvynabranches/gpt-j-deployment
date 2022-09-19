ARG BASE_IMG=gcr.io/gpt-j-and-gpt-neox20b/qna:base
FROM $BASE_IMG

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY qna.py main.py

ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE 5000

CMD [ "python3", "main.py" ]