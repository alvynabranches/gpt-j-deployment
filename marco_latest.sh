sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/marco:latest -f latest.Dockerfile --build-arg MODEL_NAME=marco .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/marco:latest
