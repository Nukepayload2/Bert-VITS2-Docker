#!/bin/bash

while true; do
    read -p "オプション（1-プリプロセス、2-トレーニング、3-テンソルボード、4-テキストからスピーチへ、5-終了）を入力してください： " choice
    case $choice in
        1) ./プリプロセス.sh ;;
        2) ./トレーニング.sh ;;
        3) tensorboard --bind_all --port 6006 --logdir=/app/logs/character ;;
        4) ./テキストからスピーチへ.sh ;;
        5) break ;;
        *) echo "無効なオプションです。" >&2;;
    esac
done