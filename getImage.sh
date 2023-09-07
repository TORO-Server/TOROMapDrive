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
python3 dynmap-timemachine.py -v http://torosaba.net:60016/ main flat [2500,100,500] [25,25] 4 ../map/main-flat-$TIME.png
python3 dynmap-timemachine.py -v http://torosaba.net:60016/ main surface [2500,100,500] [35,35] 4 ../map/main-surface-$TIME.png
python3 dynmap-timemachine.py -v http://torosaba.net:60016/ flat flat [2500,100,500] [10,10] 4 ../map/flat-flat-$TIME.png
python3 dynmap-timemachine.py -v http://torosaba.net:60016/ flat surface [2500,100,500] [15,15] 4 ../map/flat-surface-$TIME.png

# ffmpeg を利用して 解像度を下げたpngファイルを生成
cd ../map
ffmpeg -y -i main-flat-$TIME.png -s 2048:2048 main-flat.png
ffmpeg -y -i main-surface-$TIME.png -s 2048:2048 main-surface.png
ffmpeg -y -i flat-flat-$TIME.png -s 2048:2048 flat-flat.png
ffmpeg -y -i flat-surface-$TIME.png -s 2048:2048 flat-surface.png

# Googleドライブにアップロード
cd ..
ruby upload.rb ./map/main-flat.png $GoogleAppsScript
ruby upload.rb ./map/main-surface.png $GoogleAppsScript
ruby upload.rb ./map/flat-flat.png $GoogleAppsScript
ruby upload.rb ./map/flat-surface.png $GoogleAppsScript
