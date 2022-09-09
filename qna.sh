mkdir qna_model
gsutil -m cp \
  "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/config.json" \
  "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/pytorch_model.bin" \
  qna_model/.

sudo docker image build -t alvynabranches/jax:qna -f qna.Dockerfile .
sudo docker push alvynabranches/jax:qna
# sudo docker container run --name qna --rm -d -p --gpus=all 5000:5000 alvynabranches/jax:qna
# sudo docker container run --name qna --rm -d -p 5000:5000 alvynabranches/jax:qna

# watch -n 1 sudo docker container logs qna