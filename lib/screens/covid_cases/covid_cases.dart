import 'dart:convert';

import 'package:anticovidapp/screens/home/components/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CovidCases extends StatefulWidget {
  @override
  _CovidCases createState() => _CovidCases();

}

class _CovidCases extends State<CovidCases> {
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
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "You find all the information related to covid 19 cases and vaccination",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    this.dataForTomorrow["total_confirmed"].toString(),
                                    style: TextStyle(
                                        color: Color(0xFF58AD70),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
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
                margin: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    this.dataForTomorrow["total_deaths"].toString(),
                                    style: TextStyle(
                                        color: Color(0xFFDE911F),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "This indicator gives you the exact number of covid cases all around Morocco",
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
                margin: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    this.dataForTomorrow["total_recovered"].toString(),
                                    style: TextStyle(
                                        color: Color(0xFF29BCAA),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "This indicator gives you the exact number of covid cases all around Morocco",
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
                margin: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFF58AD70),
        // leading: IconButton(
        //   icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          "Covid Cases",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
