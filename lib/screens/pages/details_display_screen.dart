import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/pages/headPass.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsDisplayScreen extends StatefulWidget {
  final MyQrCode qrCode;
  final Function callBack;
  const DetailsDisplayScreen(
      {Key? key, required this.qrCode, required this.callBack})
      : super(key: key);

  @override
  _DetailsDisplayScreenState createState() => _DetailsDisplayScreenState();
}

class _DetailsDisplayScreenState extends State<DetailsDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/Vector.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            AppLocalizations.of(context)!.details_page_title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                formatDate(widget.qrCode.date),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            QrImage(
              data: widget.qrCode.content.toString(),
              version: QrVersions.auto,
              size: 200.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.qrCode.content.toString(),
                style: const TextStyle(
                    fontSize: 18.0, overflow: TextOverflow.ellipsis),
              ),
            ),
            widget.qrCode.type == 'PCR'
                ? (widget.qrCode.pcr == true
                    ? Container(
                        child: const Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 50.0,
                      ))
                    : const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ))
                : const SizedBox(
                    width: 0,
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          await myData.box.remove(widget.qrCode.id);
          widget.callBack(myData.box.getAll());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const HeadPass()),
          );
        },
        tooltip: 'remove',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
