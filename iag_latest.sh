sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/iag:latest -f latest.Dockerfile --build-arg MODEL_NAME=iag .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/iag:latest
