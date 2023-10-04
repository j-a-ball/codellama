#!bin/bash

# For use on a Linux virtual machine
ml load gcc python/3.9.0
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
pip3 install -r requirements.txt
mkdir ./models/34b
# Convert model -- PATH TO YOUR DOWNLOADED LLAMA WEIGHTS HERE
python3 convert.py ../CodeLlama-34b/ --outfile models/34b/base-f16.gguf
# Quantize the model (run ./quantize --help for more info)
./quantize ../CodeLlama-7b/ggml-model-f16.gguf ./models/7B/code-base-Q5_K.bin Q5_K
