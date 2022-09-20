if [ -d "marco_old_model" ]; then
  cd .
else
  mkdir marco_old_model
fi

if [ -f "marco_old_model/config.json" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/ms_marco_weights_slim_f16/hf_weights/config.json" marco_old_model/.
fi

if [ -f "marco_old_model/pytorch_model.bin" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/ms_marco_weights_slim_f16/hf_weights/pytorch_model.bin" marco_old_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/marco_old:base -f marco_old_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/marco_old:base
