mkdir model
# gsutil -m cp \
#   "gs://gptjax_model_weights/hf_weights_reddit/config.json" \
#   "gs://gptjax_model_weights/hf_weights_reddit/pytorch_model.bin" \
#   model/.

gsutil -m cp gptjax_model_weights/qna_weights_slim_f16/hf_weights/* model/.

sudo nvidia-docker image build -t jaxdeploy .
sudo nvidia-docker container run --name jd -d --rm -p 5000:5000 jaxdeploy

sudo watch -n 1 nvidia-docker container logs jd