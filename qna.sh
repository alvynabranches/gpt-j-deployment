# mkdir model
# gsutil -m cp \
#   "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/config.json" \
#   "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/pytorch_model.bin" \
#   model/.

sudo docker image build -t alvynabranches/jax:qna .
# sudo docker container run --gpus=all --name qna --rm -d -p 5000:5000 alvynabranches/jax:qna

# watch -n 1 sudo docker container logs qna