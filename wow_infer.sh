directory="wow_model"
bucket="gptjax_model_weights"
folder="reddit_wow_slim_f16"

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

sudo docker pull gcr.io/gpt-j-and-gpt-neox20b/wow:latest
sudo docker container run --name infer --restart always -d -p 5000:5000 gcr.io/gpt-j-and-gpt-neox20b/wow:latest
sudo docker container logs --tail 25 infer
watch -n 1 sudo docker container logs --tail 25 infer
