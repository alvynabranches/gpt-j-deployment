ARG BASE_IMG=gcr.io/gpt-j-and-gpt-neox20b/jax:base
FROM $BASE_IMG

WORKDIR /app
COPY marco_model/ model/
COPY marco.py main.py

ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE 5000

CMD [ "python3", "main.py" ]