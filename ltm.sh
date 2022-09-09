mkdir model
gsutil -m cp \
  "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/config.json" \
  "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/pytorch_model.bin" \
  .

nvidia-docker image build -t alvynabranches/jax:qna .
# nvidia-docker container run --gpus=all --name qna -d -p 5000:5000 alvynabranches/jax:qna

# watch -n 1 nvidia-docker container logs qna