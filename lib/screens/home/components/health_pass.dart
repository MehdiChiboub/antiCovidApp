import 'package:anticovidapp/screens/pages/headPass.dart';
import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HealthPass extends StatelessWidget {
  const HealthPass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.home_health_pass_title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          InkWell(
            child: Container(
              transform: Matrix4.translationValues(0.0, 20.0, 0.0),
              padding: const EdgeInsets.all(kDefaultPadding),
              height: 100,
              decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.home_health_pass_card_title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!.home_health_pass_card_description,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/images/health-pass.svg')
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeadPass()),
              );
            },
          )

        ],
      ),
    );
  }
}