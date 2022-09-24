git pull origin main
# sudo docker login

sudo gcloud auth configure-docker

source base.sh
echo -e "Completed base.sh\n\n\n"

source empathy_base.sh
rm -rf empathy_model
echo -e "Completed empathy_base.sh\n\n\n"

source lfqa_base.sh
rm -rf lfqa_model
echo -e "Completed lfqa_base.sh\n\n\n"

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



source empathy_latest.sh
echo -e "Completed empathy_latest.sh\n\n\n"

source lfqa_latest.sh
echo -e "Completed lfqa_latest.sh\n\n\n"

source ltm_latest.sh
echo -e "Completed ltm_latest.sh\n\n\n"

source marco_latest.sh
echo -e "Completed marco_latest.sh\n\n\n"

source marco_old_latest.sh
echo -e "Completed marco_old_latest.sh\n\n\n"

source qna_latest.sh
echo -e "Completed qna_latest.sh\n\n\n"
