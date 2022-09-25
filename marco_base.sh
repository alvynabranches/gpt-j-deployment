directory="marco_model"
bucket="gptjax_model_weights"
folder="msmarco_split_slim_f16"

if [ -d "${directory}" ]; then
  cd .
else
  mkdir ${directory}
fi

if [ -f "${directory}/config.json" ]; then
  cd .
else
  gsutil -m cp "gs://${bucket}/${folder}/hf_weights/config.json" ${directory}/.
fi

if [ -f "${directory}/pytorch_model.bin" ]; then
  cd .
else
  gsutil -m cp "gs://${bucket}/${folder}/hf_weights/pytorch_model.bin" ${directory}/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/marco:base -f marco_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/marco:base
rm -rf ${directory}
