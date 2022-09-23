if [ -d "lfqa_model" ]; then
  cd .
else
  mkdir lfqa_model
fi

if [ -f "lfqa_model/config.json" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/lfqa_slim_f16/hf_weights/config.json" lfqa_model/.
fi

if [ -f "lfqa_model/pytorch_model.bin" ]; then
  cd .
else
  gsutil -m cp "gs://gptjax_model_weights/lfqa_slim_f16/hf_weights/pytorch_model.bin" lfqa_model/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/lfqa:base -f lfqa_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/lfqa:base
