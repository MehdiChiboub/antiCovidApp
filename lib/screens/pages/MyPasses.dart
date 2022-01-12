import 'package:anticovidapp/screens/pages/details_display_screen.dart';
import 'package:anticovidapp/screens/pages/headPass.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:anticovidapp/screens/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//flutter packages pub run build_runner build


class MyData extends StatefulWidget {
  const MyData({Key? key, required this.title})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      child:myData.qrCodes != null
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
              : const CircularProgressIndicator()
        ,
       // This trailing comma makes auto-formatting nicer for build methods.
          );
  }
}

