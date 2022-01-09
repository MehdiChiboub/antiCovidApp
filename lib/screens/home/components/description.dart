import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Text(
            'Welcome to our AntiCovidApp to help fight against Covid-19',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              'It allows you to be alerted in case of contact with Covid-19, to be informed on the evolution of the epidemic and to store your health pass certificates.',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.w300),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
