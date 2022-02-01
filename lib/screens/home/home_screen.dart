import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/home/components/body.dart';
import 'package:anticovidapp/screens/home/components/bottom_navbar.dart';
import 'package:anticovidapp/screens/notification/local_notification.dart';
import 'package:anticovidapp/screens/notification/notification_home.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:anticovidapp/screens/qr_code/qr_code_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    myData.initDb(callbackList);
    _ref = FirebaseDatabase.instance.reference().child('notification');
    LocalNotification.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    _ref.once().then((event) {
      print('Data : ${event.snapshot.value}');
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);

        Map notif = {
          'title': message.notification!.title,
          'body': message.notification!.body
        };

        _ref.push().set(notif);
      }

      LocalNotification.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: QRFloatingButton(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/ring.svg"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Notification_Home()),
            );
          },
        ),
      ],
      backgroundColor: kPrimaryColor,
    );
  }

  Widget QRFloatingButton(BuildContext context) => FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QrCodeScreen(callback: callback)),
          );
        },
      );
}
