# source install.sh
# echo "Done with install.sh"

# sudo gcloud auth configure-docker

# source base.sh
# echo "Done with base.sh"

# source ltm_base.sh
# echo "Done with ltm_base.sh"

# source ltm_latest.sh
# echo "Done with ltm_latest.sh"
# sudo docker rmi gcr.io/gpt-j-and-gpt-neox20b/ltm:base gcr.io/gpt-j-and-gpt-neox20b/ltm:latest

# source empathy_base.sh
# echo "Done with empathy_base.sh"

# source empathy_latest.sh
# echo "Done with empathy_latest.sh"
# sudo docker rmi gcr.io/gpt-j-and-gpt-neox20b/empathy:base gcr.io/gpt-j-and-gpt-neox20b/empathy:latest

source iag_base.sh
echo "Done with iag_base.sh"

source iag_latest.sh
echo "Done with iag_latest.sh"
sudo docker rmi gcr.io/gpt-j-and-gpt-neox20b/iag:base gcr.io/gpt-j-and-gpt-neox20b/iag:latest

source marco_base.sh
echo "Done with marco_base.sh"

source marco_latest.sh
echo "Done with marco_latest.sh"
sudo docker rmi gcr.io/gpt-j-and-gpt-neox20b/marco:base gcr.io/gpt-j-and-gpt-neox20b/marco:latest

source qna_base.sh
echo "Done with qna_base.sh"

source qna_latest.sh
echo "Done with qna_latest.sh"
sudo docker rmi gcr.io/gpt-j-and-gpt-neox20b/qna:base gcr.io/gpt-j-and-gpt-neox20b/qna:latest
