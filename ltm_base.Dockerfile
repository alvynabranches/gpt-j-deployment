ARG BASE_IMG=gcr.io/gpt-j-and-gpt-neox20b/jax:base
FROM $BASE_IMG

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY ltm_model/ model/