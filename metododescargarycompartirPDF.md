         onTapEmail: () async {
                       var dio = Dio();
                

  var filePath = (await _findLocalPath()) + Platform.pathSeparator + "BURN.pdf";
 download2(dio, "https://www.googleapis.com/download/storage/v1/b/gnp-siniestros-documentos/o/sinau%2F0037564200A%2FreferenciasBancarias.pdf_TS_1613004097658?generation=1613004097859786&alt=media", filePath);
 FlutterShare.shareFile(title: "sas", filePath: filePath, ); 

                   },
                   
                   
                   
                   Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }
