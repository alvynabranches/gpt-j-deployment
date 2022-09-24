if [ -d "empathy_model" ]; then
  cd .
else
  mkdir empathy_model
fi

if [ -f "empathy_model/config.json" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/msc_empathy_weights_slim_f16/hf_weights/config.json" empathy_model/.
fi

if [ -f "empathy_model/pytorch_model.bin" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/msc_empathy_weights_slim_f16/hf_weights/pytorch_model.bin" empathy_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/empathy:base -f empathy_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/empathy:base
rm -rf empathy_model
