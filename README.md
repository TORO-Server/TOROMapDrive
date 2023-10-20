# TOROMapDrive

```sh
bash getImage.sh GoogleAppsScriptのURL
```

を実行すると TORO サーバーの Dynmap から地図を png ファイルでダウンロードして

Google ドライブにアップロードします。

[GASディレクトリ](/GAS)にあるファイルはGoogleAppsScriptに配置するコードです。

## 仕組み

1. python で Dynmap から地図をダウンロードして map ディレクトリに png ファイルで保存する。
2. ffmpeg で保存した png ファイルから解像度が低い png ファイルを生成する。
3. 生成した解像度が低い png ファイルを Google ドライブにアップロードする。

## セットアップ

Ruby、Python3、ffmpeg、git が必要です。

```sh
bash setup.sh
```
