import 'dart:io';
import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/objectbox.g.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:anticovidapp/screens/qr_code/qr_details_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrCodeScreen extends StatefulWidget {
  final Function callback;
  const QrCodeScreen({Key? key, required this.callback}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  var lastScan = null;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.qr_code_screen_title),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
                  );

                  if (result != null) {
                    String? code = await QrCodeToolsPlugin.decodeFrom(
                            result.files.single.path.toString())
                        .onError((dynamic error, dynamic stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppLocalizations.of(context)!.qr_code_screen_msg)));
                      return '';
                    });
                    if (code == '') {
                      return;
                    }
                    MyQrCode qrCode = MyQrCode(
                        content: code,
                        date: DateTime.now(),
                        type: 'qrCode',
                        id: 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              qrCode: qrCode, callback: widget.callback)),
                    );
                  } else {
                    // User canceled the picker
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.upload), Text(AppLocalizations.of(context)!.qr_code_screen_upload)],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final currentScan = DateTime.now();
      if (lastScan == null ||
          currentScan.difference(lastScan!) > const Duration(seconds: 3)) {
        lastScan = currentScan;
        result = scanData;
        final query = myData.box
            .query(MyQrCode_.content.equals(result!.code.toString()))
            .build();
        final qrCodes = query.find();
        if (qrCodes.length == 0) {
          MyQrCode qrCode = MyQrCode(
              content: result!.code,
              date: DateTime.now(),
              type: 'qrCode',
              id: 0);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(qrCode: qrCode, callback: widget.callback)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)!.qr_code_screen_error)));
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
