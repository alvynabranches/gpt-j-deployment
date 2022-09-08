# mkdir model
# gsutil -m cp \
#   "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/config.json" \
#   "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/pytorch_model.bin" \
#   model/.

# nvidia-docker image build -t alvynabranches/jaxdeploy .
nvidia-docker container run --gpus=all --name jd -d -p 5000:5000 alvynabranches/jaxdeploy

watch -n 1 nvidia-docker container logs jd