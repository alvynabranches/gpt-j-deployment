mkdir ltm_model
gsutil -m cp \
  "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/config.json" \
  "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/pytorch_model.bin" \
  ltm_model/.

sudo docker image build -t alvynabranches/jax:ltm -f ltm.Dockerfile .
sudo docker push alvynabranches/jax:ltm
# sudo docker container run --name ltm --rm -d -p --gpus=all 5000:5000 alvynabranches/jax:ltm
# sudo docker container run --name ltm --rm -d -p 5000:5000 alvynabranches/jax:ltm

# watch -n 1 sudo docker container logs ltm