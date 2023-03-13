#!/bin/sh

# Fetch tarball with models and extract
test -f stable-diffusion-webui.tbz || (
	pip install gdown
	gdown 1F9xIZx09ryZF6wDHMJDyA4CN4h1o-WCD
)

test -d stable-diffusion-webui || \
	tar jxf stable-diffusion-webui.tbz

cd stable-diffusion-webui

webui.sh --listen --nohalf


