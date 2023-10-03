#!/bin/bash

while true; do
    read -p "オプション（1-プリプロセス、2-トレーニング、3-終了）を入力する： " choice
    case $choice in
        1) ./プリプロセス.sh ;;
        2) ./トレーニング.sh ;;
        3) break ;;
        4) tensorboard --host=localhost --port 6006 --logdir=/app/logs/character ;;
        *) echo "無効なオプションです。" >&2;;
    esac
done