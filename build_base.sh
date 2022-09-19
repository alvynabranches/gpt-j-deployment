git pull origin main
# sudo docker login

# source base.sh

# source empathy_base.sh
# rm -rf empathy_model/
sudo docker image rm empathy:base
source ltm_base.sh
rm -rf ltm_model/
sudo docker image rm ltm:base
source marco_base.sh
rm -rf marco_model/
sudo docker image rm marco:base
source qna_base.sh
rm -rf qna_model/
sudo docker image rm qna:base

source empathy.sh
source ltm.sh
source marco.sh
source qna.sh
