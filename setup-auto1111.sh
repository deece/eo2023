#!/bin/sh

# Fetch tarball with models and extract
test -f stable-diffusion-webui.tar || (
	echo Downloading tarball
	pip install gdown
	gdown 1i1Pzj1kNHxutEJm9O-Cy87XfGDJLpp_h
)

test -d stable-diffusion-webui || (
	echo Extracting tarball
	tar xvf stable-diffusion-webui.tar
)

echo Done

