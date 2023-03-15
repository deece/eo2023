#!/bin/bash

set -xe

# Fetch tarball with models and extract
test -f text-generation-webui.tar || (
	echo Downloading tarball
	tar zxf ssh-key.tgz
	scp -i id_rsa.eo2023 ubuntu@192.9.132.254:/home/ubuntu/text-generation-webui.tar .
)

test -d text-generation-webui || (
	echo Extracting tarball
	tar xvf text-generation-webui.tar
)

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b

~/miniconda3/bin/conda create -y -n textgen
source ~/miniconda3/bin/activate textgen

conda install -y torchvision torchaudio pytorch-cuda=11.7 git -c pytorch -c nvidia

cd text-generation-webui

echo Preparing
pip install torch torchvision torchaudio --upgrade
pip install -r requirements.txt
#pip install -y -r repositories/GPTQ-for-LLaMa/requirements.txt
#pip uninstall -y transformers
#pip install -y git+https://github.com/zphang/transformers@llama_push

cd repositories/GPTQ-for-LLaMa
sudo apt install -y pybind11-dev
rm -rf build
python setup_cuda.py install --user

sed -i s/LLaMAConfig/LlamaConfig/g /home/deece/eo2023/text-generation-webui/repositories/GPTQ-for-LLaMa/llama.py
sed -i s/LLaMAForCausalLM/LlamaForCausalLM/g /home/deece/eo2023/text-generation-webui/repositories/GPTQ-for-LLaMa/llama.py
sed -i s/LLaMATokenizer/LlamaTokenizer/g /home/deece/eo2023/text-generation-webui/models/llama-30b/tokenizer_config.json

echo Done
