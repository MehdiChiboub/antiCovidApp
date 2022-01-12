import 'dart:convert';

import 'package:anticovidapp/screens/covid_cases/covid_cases.dart';
import 'package:flutter/material.dart';
import 'package:anticovidapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CovidInfo extends StatefulWidget {
  @override
  _CovidInfo createState() => _CovidInfo();
}


class _CovidInfo extends State<CovidInfo> {
  late Map dataForTomorrow = new Map();
  late Map dataForToday = new Map();


  fetchCovidInfo() async {
    DateTime now = DateTime.now();
    String tomorrowTime = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${(now.day + 1).toString().padLeft(2,'0')}";
    String todayTime = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";

    final responseForTomorrow = await http.get(Uri.parse(
        'https://api.coronatracker.com/v5/analytics/trend/country?countryCode=MA&startDate=2021-12-27&endDate=${tomorrowTime}'));
    final responseForToday = await http.get(Uri.parse(
        'https://api.coronatracker.com/v5/analytics/trend/country?countryCode=MA&startDate=2021-12-27&endDate=${todayTime}'));
    if (responseForTomorrow.statusCode == 200 && responseForToday.statusCode == 200) {
      setState(() {
        this.dataForTomorrow = jsonDecode(responseForTomorrow.body)[jsonDecode(responseForTomorrow.body).length - 1];
        this.dataForToday = jsonDecode(responseForToday.body)[jsonDecode(responseForToday.body).length - 1];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print("Hello");
    fetchCovidInfo();
    super.initState();
  }

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
                              this.dataForTomorrow["total_confirmed"].toString(),
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
                              this.dataForTomorrow["total_deaths"].toString(),
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
                              'Recovered',
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
                                this.dataForTomorrow["total_recovered"].toString(),
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
                                ((this.dataForTomorrow["total_confirmed"] == null ? 0 : this.dataForTomorrow["total_confirmed"]) - (this.dataForToday["total_confirmed"] == null ? 0 : this.dataForToday["total_confirmed"])).toString(),
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