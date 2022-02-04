

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'near_by_connection.dart';

class NearByConnectionEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DevicesListScreen(deviceType: DeviceType.browser)),
                );
              },
              child: Container(
                color: Colors.red,
                child: Center(
                    child: Text(
                      'BROWSER',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, 'advertiser');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DevicesListScreen(deviceType: DeviceType.advertiser)),
                );
              },
              child: Container(
                color: Colors.green,
                child: Center(
                    child: Text(
                      'ADVERTISER',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }


}