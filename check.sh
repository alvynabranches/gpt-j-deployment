git pull origin main
./lfqa_latest.sh
sudo docker rm infer -f
./lfqa_infer.sh