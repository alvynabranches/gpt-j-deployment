sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/wow:latest -f wow.Dockerfile  --build-arg MODEL_NAME=wow .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/wow:latest
