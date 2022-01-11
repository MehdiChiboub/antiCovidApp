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
  late Map data = new Map();

  fetchCovidInfo() async {
    final response = await http.get(Uri.parse(
        'https://api.coronatracker.com/v5/analytics/trend/country?countryCode=MA&startDate=2021-12-27&endDate=2022-01-11'));
    if (response.statusCode == 200) {
      setState(() {
        this.data =
            jsonDecode(response.body)[jsonDecode(response.body).length - 1];
        print(this.data["country"]);
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
                                    this.data["total_confirmed"].toString(),
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
                                    this.data["total_deaths"].toString(),
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
                                    this.data["total_recovered"].toString(),
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
