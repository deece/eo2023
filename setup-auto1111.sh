#!/bin/sh

# Fetch tarball with models and extract
test -f stable-diffusion-webui.tar || (
	echo Downloading tarball
	scp -i id_rsa.eo2023 ubuntu@192.9.132.254:/home/ubuntu/stable-diffusion-webui.tar .
)

test -d stable-diffusion-webui || (
	echo Extracting tarball
	tar xvf stable-diffusion-webui.tar
)

echo Done

