mkdir marco_model

if [ -f "marco_model/config.json" ]; then
  echo "config.json exists"
else
  echo "config.json does not exist"
  gsutil -m cp "gs://gptjax_model_weights/ms_marco_weights_slim_f16/hf_weights/config.json" marco_model/.
fi

if [ -f "marco_model/pytorch_model.bin" ]; then
  echo "pytorch_model.bin exists"
else
  echo "pytorch_model.bin does not exist"
  gsutil -m cp "gs://gptjax_model_weights/ms_marco_weights_slim_f16/hf_weights/pytorch_model.bin" marco_model/.
fi

sudo docker image build -t alvynabranches/jax:marco -f marco.Dockerfile .
sudo docker push alvynabranches/jax:marco
# sudo docker container run --name marco --rm -d -p --gpus=all 5000:5000 alvynabranches/jax:marco
# sudo docker container run --name marco --rm -d -p 5000:5000 alvynabranches/jax:marco

# watch -n 1 sudo docker container logs marco