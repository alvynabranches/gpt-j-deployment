FROM gcr.io/gpt-j-and-gpt-neox20b/jax:base

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY wow_model/ model/
