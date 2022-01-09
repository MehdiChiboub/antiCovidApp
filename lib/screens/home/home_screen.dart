import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/home/components/body.dart';
import 'package:anticovidapp/screens/home/components/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: QRFloatingButton(),
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

  Widget QRFloatingButton() => FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: kPrimaryColor,
        onPressed: () {},
      );
}
