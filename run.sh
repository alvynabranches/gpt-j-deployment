# mkdir model
# gsutil -m cp \
#   "gs://gptjax_model_weights/hf_weights_reddit/config.json" \
#   "gs://gptjax_model_weights/hf_weights_reddit/pytorch_model.bin" \
#   model/.

sudo docker image build -t jaxdeploy .
sudo docker container run --rm --name jd -d -p 5000:5000 jaxdeploy

sudo watch -n 1 docker container logs jd