sudo gcloud auth configure-docker

sudo docker pull gcr.io/gpt-j-and-gpt-neox20b/marco_old:latest
sudo docker container run --name infer --restart always -d -p 5000:5000 gcr.io/gpt-j-and-gpt-neox20b/marco_old:latest
sudo docker container logs infer
watch -n 1 sudo docker container logs infer