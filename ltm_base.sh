directory="ltm_model"
bucket="gptjax_model_weights"
folder="reddit_msc_ltm_weights_slim_f16"

if [ ! -d "${directory}" ]; then
  mkdir ${directory}
fi

if [ ! -f "${directory}/config.json" ]; then
  gsutil -m cp "gs://${bucket}/${folder}/hf_weights/config.json" ${directory}/.
fi

if [ ! -f "${directory}/pytorch_model.bin" ]; then
  gsutil -m cp "gs://${bucket}/${folder}/hf_weights/pytorch_model.bin" ${directory}/.
fi

sudo docker image build -t gcr.io/gpt-j-and-gpt-neox20b/ltm:base -f ltm_base.Dockerfile .
sudo docker push gcr.io/gpt-j-and-gpt-neox20b/ltm:base
rm -rf ${directory}
