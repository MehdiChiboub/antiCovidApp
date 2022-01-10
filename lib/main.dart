import 'package:anticovidapp/screens/pages/headPass.dart';
import 'package:anticovidapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F8FD),
        primaryColor: Color(0xFF0C9869),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Color(0xFF3C4046)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(
        title: 'Health Pass Scanner',
      ),
    );
  }
}