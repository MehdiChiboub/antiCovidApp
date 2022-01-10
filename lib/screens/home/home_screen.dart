import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/home/components/body.dart';
import 'package:anticovidapp/screens/home/components/bottom_navbar.dart';
import 'package:anticovidapp/screens/qr_code/instances.dart';
import 'package:anticovidapp/screens/qr_code/qr_code.dart';
import 'package:anticovidapp/screens/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// class HomeScreen extends StatefulWidget {
//   var callback;

//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: const Body(),
//       bottomNavigationBar: const BottomNavBar(),
//       floatingActionButton: QRFloatingButton(context),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/icons/menu.svg"),
//         onPressed: () {},
//       ),
//       backgroundColor: kPrimaryColor,
//     );
//   }

//   Widget QRFloatingButton(BuildContext context) => FloatingActionButton(
//         child: const Icon(Icons.qr_code_scanner),
//         backgroundColor: kPrimaryColor,
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => QrCodeScreen(callback: callback)),
//           );
//         },
//       );
// }

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    myData.initDb(callbackList);
  }

  // void _addQrCode() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => QrCodeScreen(callback: callback)),
  //   );
  // }

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
