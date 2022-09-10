mkdir empathy_model

if [ -f "empathy_model/config.json" ]; then
  echo "config.json exists"
else
  echo "config.json does not exist"
  gsutil -m cp "gs://gptjax_model_weights/msc_empathy_weights_slim_f16/hf_weights/config.json" empathy_model/.
fi

if [ -f "empathy_model/pytorch_model.bin" ]; then
  echo "pytorch_model.bin exists"
else
  echo "pytorch_model.bin does not exist"
  gsutil -m cp "gs://gptjax_model_weights/msc_empathy_weights_slim_f16/hf_weights/pytorch_model.bin" empathy_model/.
fi

sudo docker image build -t alvynabranches/jax:empathy -f empathy.Dockerfile .
sudo docker push alvynabranches/jax:empathy
# sudo docker container run --name empathy --rm -d -p --gpus=all 5000:5000 alvynabranches/jax:empathy
# sudo docker container run --name empathy --rm -d -p 5000:5000 alvynabranches/jax:empathy

# watch -n 1 sudo docker container logs empathy