directory="marco_old_model"
bucket="gptjax_model_weights"
folder="ms_marco_weights_slim_f16"

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

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/marco_old:base -f marco_old_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/marco_old:base
rm -rf ${directory}
