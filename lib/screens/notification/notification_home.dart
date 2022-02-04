import 'dart:convert';

import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/notification/notif.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notification_Home extends StatefulWidget{
  @override
  State<Notification_Home> createState() => Notification();

}

class Notification extends State<Notification_Home> {

  late DatabaseReference _ref1;
  late List<Notif> data;
  @override
  void initState() {
    super.initState();

    _ref1 = FirebaseDatabase.instance.reference().child('notification');

    print(_ref1.parent);
    _ref1.once().then((event) {
      print('Data : ${event.snapshot.value}');
      // print(SubString(event.snapshot.value.toString(), "body:", ", title"));
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Notifications",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/Vector.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Notifications",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
}

String  SubString(String str,String start,String end) {


  final startIndex = str.indexOf(start);
  final endIndex = str.indexOf(end, startIndex + start.length);

  return str.substring(startIndex + start.length, endIndex);
}