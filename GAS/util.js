// レスポンス 生成
function result(object) {
    return ContentService.createTextOutput(
        JSON.stringify(object)
    ).setMimeType(ContentService.MimeType.JSON);
}

//上書きでファイルをアップロードする
function upload(folderId, fileBlob, filename) {

    //指定のフォルダを取得する
    var folder = DriveApp.getFolderById(folderId);

    //ファイル名を指定してファイルを取得してみる
    var files = folder.getFilesByName(filename);

    if (files.hasNext()) {
        //Driveのファイルを上書きアップロード
        Drive.Files.update({}, files.next().getId(), fileBlob);
    } else {
        //ファイルを新規アップロードする
        folder.createFile(fileBlob);
    }
}