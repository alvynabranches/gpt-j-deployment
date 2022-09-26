sudo apt install git curl docker docker.io htop bpytop python3-pip -y
git clone https://github.com/alvynabranches/gpt-j-deployment
cd gpt-j-deployment
python3 -m pip install --upgrade pip setuptools
pip install -r requirements.txt --no-warn-script-location
