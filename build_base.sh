git pull origin main
# sudo docker login

# source base.sh

# source empathy_base.sh
# rm -rf empathy_model/
source ltm_base.sh
rm -rf ltm_model/
source marco_base.sh
rm -rf marco_model/
source qna_base.sh
rm -rf qna_model/

source empathy.sh
source ltm.sh
source marco.sh
source qna.sh