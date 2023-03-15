#!/bin/sh

# Fetch tarball with models and extract
test -f text-generation-webui.tar || (
	echo Downloading tarball
	pip install gdown
	gdown 15tgL9BsmYgF6JtFWTXKf6wj3tHg8pBq2
)

test -d text-generation-webui || (
	echo Extracting tarball
	tar jxvf text-generation-webui.tar
)

cd text-generation-webui

echo Preparing
pip install -r requirements.txt
pip uninstall transformers
pip install git+https://github.com/zphang/transformers@llama_push

echo Done
