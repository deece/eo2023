#!/bin/sh

# Fetch tarball with models and extract
test -f stable-diffusion-webui.tar || (
	echo Downloading tarball
	wget http://138.44.248.8/stable-diffusion-webui.tar
)

test -d stable-diffusion-webui || (
	echo Extracting tarball
	tar xvf stable-diffusion-webui.tar
)

echo Done

