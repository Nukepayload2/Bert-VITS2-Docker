#!/bin/bash

read -p "エポックを入力してください： " choice
python3 webui.py -m "/app/logs/character/G_$choice.pth"
