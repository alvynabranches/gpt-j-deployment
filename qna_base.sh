mkdir qna_model

if [ -f "qna_model/config.json" ]; then
  echo "config.json exists"
else
  echo "config.json does not exist"
  gsutil -m cp "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/config.json" qna_model/.
fi

if [ -f "qna_model/pytorch_model.bin" ]; then
  echo "pytorch_model.bin exists"
else
  echo "pytorch_model.bin does not exist"
  gsutil -m cp "gs://gptjax_model_weights/qna_weights_slim_f16/hf_weights/pytorch_model.bin" qna_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/qna:base -f qna.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/qna:base
