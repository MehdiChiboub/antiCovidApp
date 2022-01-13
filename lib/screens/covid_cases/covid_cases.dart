import 'dart:convert';

import 'package:anticovidapp/constants.dart';
import 'package:anticovidapp/screens/home/components/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidCases extends StatefulWidget {
  const CovidCases({Key? key}) : super(key: key);

  @override
  _CovidCases createState() => _CovidCases();
}

class _CovidCases extends State<CovidCases> {
  late Map dataForTomorrow = new Map();
  late Map dataForToday = new Map();
  var vaccineData;

  fetchCovidInfo() async {
    DateTime now = DateTime.now();
    String tomorrowTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${(now.day + 1).toString().padLeft(2, '0')}";
    String todayTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    final responseForTomorrow = await http.get(Uri.parse(
        'https://api.coronatracker.com/v5/analytics/trend/country?countryCode=MA&startDate=2021-12-27&endDate=${tomorrowTime}'));
    final responseForToday = await http.get(Uri.parse(
        'https://api.coronatracker.com/v5/analytics/trend/country?countryCode=MA&startDate=2021-12-27&endDate=${todayTime}'));
    final vaccineDataResponse = await http.get(Uri.parse(
        'https://graphics.thomsonreuters.com/data/2020/coronavirus/owid-covid-vaccinations/countries/morocco/data.json'));
    if (responseForTomorrow.statusCode == 200 &&
        responseForToday.statusCode == 200 &&
        vaccineDataResponse.statusCode == 200) {
      setState(() {
        dataForTomorrow = jsonDecode(responseForTomorrow.body)[
            jsonDecode(responseForTomorrow.body).length - 1];
        dataForToday = jsonDecode(responseForToday.body)[
            jsonDecode(responseForToday.body).length - 1];
        vaccineData = jsonDecode(vaccineDataResponse.body)['peopleVaccinated'][
            jsonDecode(vaccineDataResponse.body)['peopleVaccinated'].length -
                1]['count'];
      });
    }
  }

  @override
  void initState() {
    fetchCovidInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "You find all the information related to Covid-19 cases and vaccination in Morocco",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dataForTomorrow["total_confirmed"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF58AD70),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Covid Cases",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "This indicator gives you the exact number of covid cases all around Morocco",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dataForTomorrow["total_deaths"].toString(),
                                    style: const TextStyle(
                                        color: Color(0xFFDE911F),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Covid Death cases",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "This indicator gives you the exact number of covid death cases all around Morocco",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                margin: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)),
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  vaccineData.toString(),
                                  style: const TextStyle(
                                      color: Color(0xff3092D9),
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Vaccinated people",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  "This indicator gives you the exact number of vaccinated people all around Morocco",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black,
              margin: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
            ),
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dataForTomorrow["total_recovered"].toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF29BCAA),
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Recovered people",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  "This indicator gives you the exact number of recovered people all around Morocco",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black,
              margin: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Covid Cases",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
