#!/bin/sh

# Fetch tarball with models and extract
test -f text-generation-webui.tar.bz2 || (
	pip install gdown
	gdown 1pV2qGujZYs9vqbgabqGCPX14_CK2UzII
)

test -d text-generation-webui || \
	tar jxf text-generation-webui.tar.bz2

cd text-generation-webui

pip install -r requirements.txt
pip uninstall transformers
pip install git+https://github.com/zphang/transformers@llama_push

python server.py --listen

