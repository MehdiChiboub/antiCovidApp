import 'package:anticovidapp/screens/covid_cases/covid_cases.dart';
import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CovidInfo extends StatelessWidget {
  const CovidInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding + 30),
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Covid Information',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    child: Text(
                      'see more',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CovidCases()),
                      );
                    }),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Covid Cases',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              '80, 000',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Covid Deaths',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              '90, 000',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: const Color(0xffDE911F),
                                      fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(top: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Vaccinated',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '80, 000',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        color: const Color(0xff29BCAA),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(top: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'New Cases',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '300',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        color: const Color(0xff3092D9),
                                        fontWeight: FontWeight.w600),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
