#!/bin/sh


# Fetch tarball with models and extract
test -f text-generation-webui.tar || (
	echo Downloading tarball
	tar zxf ssh-key.tgz
	scp -i id_rsa.eo2023 ubuntu@192.9.247.121:/home/ubuntu/text-generation-webui.tar .
)

test -d text-generation-webui || (
	echo Extracting tarball
	tar xvf text-generation-webui.tar
)

cd text-generation-webui

echo Preparing
pip install -r requirements.txt
pip uninstall transformers
pip install git+https://github.com/zphang/transformers@llama_push

echo Done
