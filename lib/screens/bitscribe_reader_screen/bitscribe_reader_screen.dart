// ignore_for_file: unused_catch_stack

import 'dart:io';
import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/navigation_drawer.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class BitscribeReaderScreen extends StatefulWidget {
  const BitscribeReaderScreen({Key? key}) : super(key: key);

  @override
  State<BitscribeReaderScreen> createState() => _BitscribeReaderScreenState();
}

class _BitscribeReaderScreenState extends State<BitscribeReaderScreen> {
  String? taskID;
  late ProgressDialog pd;
  int progress = 0;
  bool isDownloading = false;
  String path = '';
  String bitscribePreviewLink =
      "https://drive.google.com/uc?id=1-RMKYyHTgC0OR4dMaNgOnqWDgbE6inlK&export=download";
  String bitscribeDownloadLink =
      "https://drive.google.com/uc?id=1-Mh4-9_0ePRN8YMYjWHrsaFVZF967bOo&export=download";
  Future download(String savePath) async {
    if (await Permission.storage.request().isGranted) {
      if (!(await File(savePath).exists())) {
        try {
          isDownloading = true;
          http.StreamedResponse response = await http.Client()
              .send(http.Request('GET', Uri.parse(bitscribeDownloadLink)));
          int total = response.contentLength ?? 0;
          List<int> bytes = [];
          int received = 0;
          response.stream.listen((value) {
            bytes.addAll(value);
            received += value.length;
            int progress = (received / total * 100).toInt();
            pd.update(
                value: progress,
                msg:
                    "Downloading(${(received * 1e-6).toStringAsFixed(2)}/${(total * 1e-6).toStringAsFixed(2)} MB)");
          }).onDone(() async {
            if (received == total) {
              File file = File(savePath);
              await file.writeAsBytes(bytes);
              isDownloading = false;
              pd.close();
              Fluttertoast.showToast(msg: 'File saved at $savePath');
            }
          });
        } catch (e) {
          Fluttertoast.showToast(msg: 'unknown error occurred');
          pd.close();
        }
      } else {
        pd.close();
        Fluttertoast.showToast(
            msg:
                "pd.update(value: 100, msg: 'File already exists at $savePath");
      }
    }
  }

  Future<String?> getSavedDir() async {
    String? externalStorageDirPath;

    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        Directory? directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
        externalStorageDirPath = directory?.path;
      } catch (err, st) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  Future<void> initPath() async {
    path = ((await getSavedDir()) ??
            (await getApplicationDocumentsDirectory()).path) +
        '/bitscribe.pdf';
  }

  Future<int> startDownload() async {
    pd = ProgressDialog(context: context);
    pd.show(
        max: 100,
        msg: 'Preparing download',
        progressValueColor: Pallet.darkPrimaryColor,
        msgMaxLines: 2,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        hideValue: true,
        msgFontSize: 12,
        msgFontWeight: FontWeight.w600,
        progressType: ProgressType.valuable);
    if (!isDownloading) {
      download(path);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    initPath();
    return Scaffold(
      endDrawer: NavigationDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 8, 0, 0),
            child: Builder(builder: (context) {
              return FloatingActionButton(
                  elevation: 12,
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).canvasColor,
                    size: 33,
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                          initialIndex: 0,
                        ),
                      ),
                    );
                  });
            }),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Builder(builder: (context) {
              return FloatingActionButton(
                elevation: 100,
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).canvasColor,
                  size: 33,
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                foregroundColor: Theme.of(context).backgroundColor,
              );
            }),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          isDownloading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const HomeScreen(initialIndex: 0);
          }));
          return true;
        },
        child: SafeArea(
          child: Stack(
            children: [
              FutureBuilder<bool>(
                future: Permission.storage.isGranted,
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot<bool> isGranted) {
                  return path.isNotEmpty &&
                          isGranted.data == true &&
                          File(path).existsSync()
                      ? SfPdfViewer.file(File(path))
                      : SfPdfViewer.network(bitscribePreviewLink);
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16, right: 16),
                  child: Builder(builder: (context) {
                    return FloatingActionButton(
                      elevation: 100,
                      child: Icon(
                        Icons.download,
                        color: Theme.of(context).backgroundColor,
                        size: 20,
                      ),
                      backgroundColor: Theme.of(context).canvasColor,
                      onPressed: () {
                        startDownload();
                      },
                      foregroundColor: Theme.of(context).backgroundColor,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
