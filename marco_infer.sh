sudo gcloud auth configure-docker

sudo docker pull gcr.io/gpt-j-and-gpt-neox20b/marco:latest
sudo docker container run --name infer --rm -d -p 5000:5000 gcr.io/gpt-j-and-gpt-neox20b/marco:latest
