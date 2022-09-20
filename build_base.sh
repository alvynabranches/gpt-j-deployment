git pull origin main
# sudo docker login

sudo gcloud auth configure-docker

source base.sh
echo -e "Completed base.sh\n\n\n"

source empathy_base.sh
rm -rf empathy_model
echo -e "Completed empathy_base.sh\n\n\n"

source ltm_base.sh
rm -rf ltm_model
echo -e "Completed ltm_base.sh\n\n\n"

source marco_base.sh
rm -rf marco_model
echo "Completed marco_base.sh\n\n\n"

source marco_old_base.sh
rm -rf marco_old_model
echo "Completed marco_old_base.sh\n\n\n"

source qna_base.sh
rm -rf qna_model
echo -e "Completed qna_base.sh\n\n\n"



source empathy.sh
echo -e "Completed empathy.sh\n\n\n"

source ltm.sh
echo -e "Completed ltm.sh\n\n\n"

source marco.sh
echo -e "Completed marco.sh\n\n\n"

source marco_old.sh
echo -e "Completed marco_old.sh\n\n\n"

source qna.sh
echo -e "Completed qna.sh\n\n\n"
