source install.sh
echo "Done with install.sh"

sudo gcloud auth configure-docker

source base.sh
echo "Done with base.sh"

source ltm_base.sh
echo "Done with ltm_base.sh"

source ltm_latest.sh
echo "Done with ltm_latest.sh"

source empathy_base.sh
echo "Done with empathy_base.sh"

source empathy_latest.sh
echo "Done with empathy_latest.sh"

# source iag_base.sh
echo "Done with iag_base.sh"

# source iag_latest.sh
echo "Done with iag_latest.sh"

source marco_base.sh
echo "Done with marco_base.sh"

source marco_latest.sh
echo "Done with marco_latest.sh"

source qna_base.sh
echo "Done with qna_base.sh"

source qna_latest.sh
echo "Done with qna_latest.sh"
