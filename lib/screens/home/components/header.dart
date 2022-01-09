import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      child: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, bottom: kDefaultPadding + 20),
          height: size.height * 0.2,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Row(
            children: <Widget>[
              Text(
                'ANTI COVID',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
