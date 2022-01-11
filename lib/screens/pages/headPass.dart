import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:SingleChildScrollView(
        child:Column(
          children: [
            Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "you can download the document to get your pass.this pass will allow you to get ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                  ),
            Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Document",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "You can get the document from ........................................................................................................................",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        padding: EdgeInsets.all(8.0),
                                        child: Image.asset('assets/images/pass.png')
                                      )
                                    ],
                                  ),
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
                      margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)
                  ),
            Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Help",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "you can ask for help by calling us : 06 66 66 66 66",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  padding: EdgeInsets.all(8.0),
                                  child:IconButton(
                                      onPressed: () {},
                                      icon: Image.asset('assets/images/call.png')
                                  )
                                )
                              ],
                            ),
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
                margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 10.0)
            ),

          ],
              ),
            )
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Color(0xFF0C9869),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/Vector.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        title: Text(
          "Pass Sanitaire",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        )
    );
  }
}