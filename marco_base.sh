if [ -d "marco_model" ]; then
  cd .
else
  mkdir marco_model
fi

if [ -f "marco_model/config.json" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/msmarco_split_slim_f16/hf_weights/config.json" marco_model/.
fi

if [ -f "marco_model/pytorch_model.bin" ]; then
  echo "pytorch_model.bin exists"
else
  echo "pytorch_model.bin does not exist"
  gsutil -m cp "gs://gptjax_model_weights/msmarco_split_slim_f16/hf_weights/pytorch_model.bin" marco_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/marco:base -f marco_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/marco:base
