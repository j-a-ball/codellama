#!/bin/bash

# Make llama.cpp on Apple M1
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
LLAMA_METAL=1 make
mkdir model/7B

# Create conda env
conda create -n codellama python=3.11
conda activate codellama
pip install -r requirements.txt

# Convert model -- PATH TO YOUR DOWNLOADED LLAMA WEIGHTS HERE
python convert.py ../CodeLlama-7b

# Quantize the model (run ./quantize --help for more info)
./quantize ../CodeLlama-7b/ggml-model-f16.gguf ./models/7B/code-base-Q5_K.bin Q5_K
