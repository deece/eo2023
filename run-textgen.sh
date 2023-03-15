#!/bin/bash

cd text-generation-webui

source ~/miniconda3/bin/activate textgen

echo Launching
python server.py --listen --load-in-4bit

