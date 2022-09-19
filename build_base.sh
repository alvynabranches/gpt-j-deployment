git pull origin main
# sudo docker login

source base.sh
echo "Completed base.sh"

source empathy_base.sh
rm -rf empathy_model
echo "Completed empathy_base.sh"

source ltm_base.sh
rm -rf ltm_model
echo "Completed ltm_base.sh"

source marco_base.sh
rm -rf marco_model
echo "Completed marco_base.sh"

source qna_base.sh
rm -rf qna_model
echo "Completed qna_base.sh"

source empathy.sh
echo "Completed empathy.sh"

source ltm.sh
echo "Completed ltm.sh"

source marco.sh
echo "Completed marco.sh"

source qna.sh
echo "Completed qna.sh"
