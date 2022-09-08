mkdir model
gsutil -m cp \
  "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/config.json" \
  "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/pytorch_model.bin" \
  model/.

sudo nvidia-docker image build -t jaxdeploy .
sudo nvidia-docker container run --name jd -d  -p 5000:5000 jaxdeploy

sudo watch -n 1 nvidia-docker container logs jd