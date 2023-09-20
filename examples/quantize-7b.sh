#!/ usr/ bin / env bash
git clone https://github.com/ggerganov/llama.cpp
cd ./llama.cpp
cd ./models
mkdir 7B 
python3 convert.py --outfile models/7B/base-f16.bin --outtype f16 ../CodeLlama-7b
make
./quantize ./models/7B/code-base-f16.bin ./models/7B/code-base-q4_0.bin q4_0
./main -m ./models/7B/code-base-q4_0.bin -n 128
