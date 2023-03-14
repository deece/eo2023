#!/bin/sh

# Fetch tarball with models and extract
test -f stable-diffusion-webui.tbz || (
	echo Downloading tarball
	pip install gdown
	gdown 1F9xIZx09ryZF6wDHMJDyA4CN4h1o-WCD
)

test -d stable-diffusion-webui || (
	echo Extracting tarball
	tar jxf stable-diffusion-webui.tbz
)

cd stable-diffusion-webui

echo Launching
webui.sh --listen --nohalf


