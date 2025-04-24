#!/bin/bash

# GoogleAppsScriptのURLを取得
GoogleAppsScript=$1

# このshファイルがあるディレクトリに移動(相対パスに対応させるため)
cd $(dirname $0)
# 時間取得
TIME=$(date "+%Y-%m-%d")

# Dynmapの画像を取得する
# https://github.com/hampta/minecraft-dynmap-timemachine
cd ./minecraft-dynmap-timemachine
python3 dynmap-timemachine.py -v https://map.torosaba.net/ main flat [0,100,-2000] [25,25] 4 ../map/main-flat-origin
python3 dynmap-timemachine.py -v https://map.torosaba.net/ flat flat [0,100,0] [10,10] 4 ../map/flat-flat-origin

# ffmpeg を利用して 解像度を下げたpngファイルを生成
cd ../map
ffmpeg -y -i main-flat-origin.png -s 2048:2048 main-flat-lite.png
ffmpeg -y -i flat-flat-origin.png -s 2048:2048 flat-flat-lite.png

# Googleドライブにアップロード
cd ..
ruby upload.rb ./map/main-flat.png $GoogleAppsScript
ruby upload.rb ./map/flat-flat.png $GoogleAppsScript
