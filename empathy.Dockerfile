FROM gcr.io/gpt-j-and-gpt-neox20b/empathy:base

WORKDIR /app
COPY empathy.py main.py

ENV HOST 0.0.0.0
ENV PORT 5000
ENV DEBUG true
EXPOSE 5000

CMD [ "python3", "main.py" ]