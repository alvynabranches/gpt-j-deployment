sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/ltm:latest -f latest.Dockerfile --build-arg MODEL_NAME=ltm .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/ltm:latest
