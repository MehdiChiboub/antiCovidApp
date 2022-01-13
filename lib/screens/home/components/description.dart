import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.description_title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              AppLocalizations.of(context)!.description_text,
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
