#!/bin/bash -v
# Tensorboard
nohup tensorboard --bind_all --port 6006 --logdir=/app/logs/character &
# Start
python3 train_ms.py -c configs/config.json -m character
