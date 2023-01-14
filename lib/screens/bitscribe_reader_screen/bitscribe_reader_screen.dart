import 'dart:io';
import 'package:cssapp/configs/configs.dart';
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
  String bitscribeLink =
      "http://drive.google.com/uc?id=1k8KajSna-Ftcx-Xsz8LQz8R_lX9iq0bP&export=download";
  Future download(String savePath) async {
    if (await Permission.storage.request().isGranted) {
      if (!(await File(savePath).exists())) {
        try {
          isDownloading = true;
          http.StreamedResponse response = await http.Client()
              .send(http.Request('GET', Uri.parse(bitscribeLink)));
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
    return WillPopScope(
      onWillPop: () async {
        isDownloading = false;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen(initialIndex: 0);
        }));
        return true;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16),
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
        body: SafeArea(
          child: SizedBox(
            child: path.isNotEmpty && File(path).existsSync()
                ? SfPdfViewer.file(File(path))
                : SfPdfViewer.network(bitscribeLink),
          ),
        ),
      ),
    );
  }
}
