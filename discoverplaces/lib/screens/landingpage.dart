import 'package:discoverplaces/screens/homepage.dart';
import 'package:discoverplaces/theme.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Image.asset('assets/images/stargazing.png'),
          Container(
            color: backgroundColor,
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 27,
                      height: 4,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          color: primaryText2,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text(
                      'HELLO',
                      style: headlines2,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Discover Places',
                      style: headlines,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Take a city break and discover the beauty of \nnature. Unwind without any worries and find \nout what freedom really means.',
                      style: leadlines,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          var router = MaterialPageRoute(
                              builder: (BuildContext context) => HomePage());

                          Navigator.of(context).push(router);
                        },
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        label: Text(
                          'Get Started',
                          style: buttonText,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
