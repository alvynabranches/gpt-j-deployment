sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/empathy:latest -f latest.Dockerfile --build-arg MODEL_NAME=empathy .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/empathy:latest
