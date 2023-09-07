function doPost(e) {

    // パラメーター取得
    const filename = e.parameters.filename;
    const file = e.parameters.file;

    if (!filename || !file) {
        // jsonを返す
        return result({ "result": "Error" });
    } else {
        // base64から変換
        var data = Utilities.base64Decode(file, Utilities.Charset.UTF_8);
        // blob 作成
        var blob = Utilities.newBlob(data, Type, filename);

        // Googleドライブにアップロードする処理
        upload(FolderId, blob, filename);

        // jsonを返す
        return result({ "result": "Completed" });
    }
}
