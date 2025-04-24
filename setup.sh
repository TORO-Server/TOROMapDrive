#!/bin/bash

# このshファイルがあるディレクトリに移動
cd $(dirname $0)

# mapディレクトリ作成
mkdir map

# git クローン
git clone https://github.com/hampta/minecraft-dynmap-timemachine.git
# ライブラリインストール
cd ./minecraft-dynmap-timemachine
pip install -r requirements.txt
