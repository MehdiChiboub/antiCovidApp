import 'package:flutter/material.dart';
import 'package:anticovidapp/screens/home/components/header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(size: size),
          Container(
            transform: Matrix4.translationValues(0.0, -42.0, 0.0),
            child: SvgPicture.asset('assets/images/home-svg.svg'),
          )
        ],
      ),
    );
  }
}
