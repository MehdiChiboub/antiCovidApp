import 'package:anticovidapp/screens/covid_cases/covid_cases.dart';
import 'package:anticovidapp/screens/home/home_screen.dart';
import 'package:anticovidapp/screens/pages/headPass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anticovidapp/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 35,
            color: Colors.black.withOpacity(0.09),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/home-solid.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen(
                          title: '',
                        )),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/inbox.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HeadPass()),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/virus.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CovidCases()),
              );
            },
          ),
        ],
      ),
    );
  }
}
