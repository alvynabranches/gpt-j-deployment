mkdir ltm_model

if [ -f "ltm_model/config.json" ]; then
  echo "config.json exists"
else
  echo "config.json does not exist"
  gsutil -m cp "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/config.json" ltm_model/.
fi

if [ -f "ltm_model/pytorch_model.bin" ]; then
  echo "pytorch_model.bin exists"
else
  echo "pytorch_model.bin does not exist"
  gsutil -m cp "gs://gptjax_model_weights/msc_ltm_weights_slim_f16/hf_weights/pytorch_model.bin" ltm_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/ltm:base -f ltm.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/ltm:base
