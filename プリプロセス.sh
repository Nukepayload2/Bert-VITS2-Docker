#!/bin/bash -v
# Slice all audio data should be done manually
# Generate genshin.list should be done manually (see esd.list)

# Process all text data
python3 preprocess_text.py

# Generate dataset
python3 resample.py

# Generate bert.pt
python3 bert_gen.py
