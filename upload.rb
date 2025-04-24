require "net/http"
require "base64"

Path = ARGV[0]
URL = ARGV[1]

puts "Path: #{Path}"
puts "URL: #{URL}"

# ファイルを開く
File.open(Path, "rb") do |content|
  # ファイルの内容を Base64 に変換
  base64 = Base64.encode64(content.read)
  # パスからファイル名を取得
  name = File.basename(Path, ".*")
  # Postのパラメーターを設定
  params = { filename: name, file: base64 }
  # URI 作成
  uri = URI.parse(URL)
  # Post リクエスト 送信
  Net::HTTP.post_form(uri, params) do |res|
    res.code
    res.body
  end
end
