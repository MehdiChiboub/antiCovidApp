import 'package:anticovidapp/screens/pages/details_display_screen.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:anticovidapp/screens/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//flutter packages pub run build_runner build

class MyData extends StatefulWidget {
  const MyData({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyData> createState() => MyPasses();
}

class MyPasses extends State<MyData> {
  @override
  void initState() {
    super.initState();
    myData.initDb(callbackList);
  }

  void _addQrCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrCodeScreen(callback: callback)),
    );
  }

  void callback(MyQrCode qrCode) {
    setState(() {
      myData.qrCodes?.add(qrCode);
    });
  }

  void callbackList(List<MyQrCode> qrCodes) {
    setState(() {
      myData.qrCodes = qrCodes;
    });
  }

  static const IconData qr_code_scanner_rounded =
      IconData(0xf00cc, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: myData.qrCodes != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: myData.qrCodes?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsDisplayScreen(
                          callBack: callbackList,
                          qrCode: myData.qrCodes![index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: QrImage(
                      data: myData.qrCodes![index].content.toString(),
                      version: QrVersions.auto,
                      size: 50.0,
                    ),
                    title: Text(myData.qrCodes![index].type.toString()),
                    subtitle: Text(formatDate(myData.qrCodes![index].date)),
                  ),
                );
              })
          : const CircularProgressIndicator(),
    );
  }
}
