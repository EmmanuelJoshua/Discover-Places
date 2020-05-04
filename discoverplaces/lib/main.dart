import 'package:discoverplaces/screens/landingpage.dart';
import 'package:discoverplaces/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discover Places',
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: primaryColor,
//      ),
      home: LandingPage(),
    );
  }
}