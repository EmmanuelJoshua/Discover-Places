import 'package:discoverplaces/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = new TextEditingController();
  PageController _pageController;
  int bottomIndex = 0;

  final List<String> categoryImages = [
    'assets/images/mountains.png',
    'assets/images/tools.png',
    'assets/images/lifeboat.png',
    'assets/images/pines.png',
  ];

  final List<String> categories = [
    'Mountains',
    'Camping',
    'Lakes',
    'Forest',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292241),
      body: ListView(
        children: <Widget>[
          StickyHeader(
              header: Container(
                width: double.infinity,
                height: 70,
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/search.png',
                              width: 20.5,
                              filterQuality: FilterQuality.high,
                            ),
                            Padding(
                              padding: EdgeInsets.all(7),
                            ),
                            Expanded(
                                child: TextField(
                              controller: search,
                              style: leadlines2,
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Search', hintStyle: leadlines2),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/user.jpg',
                          width: 32,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              content: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Explore Places',
                        style: headlines,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 28, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Popular Categories',
                        style: headlines2,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 59,
                                  padding: EdgeInsets.all(11),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    categoryImages[index],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(6),
                                ),
                                Text(
                                  categories[index],
                                  style: leadlines2,
                                )
                              ],
                            ));
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Trending Visits', style: headlines2),
                      Text('View all',
                          style: TextStyle(
                              fontSize: 12.8,
                              color: Color(0xFFA3A9B9),
                              fontFamily: 'MontserratLight',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                Container(
                  height: 230,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    pageSnapping: false,
                    itemCount: 3,
                    onPageChanged: (int index) {

                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _cardSelector(index);
                    },
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  _cardSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.6) + 0.01).clamp(0.0, 1.0);
        }
        return Container(
          width: 100,
          child: SizedBox(
//            height: Curves.easeInOut.transform(value) * 270,
//            width: Curves.easeInOut.transform(value) * 100,
//            width: 100,
            child: widget,
          ),
        );
      },
      child: Container(
              margin: EdgeInsets.only(right: 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xFF232B3E),
                  gradient: LinearGradient(colors: [
                    Color(0xFF354360),
                    Color(0xFF232B3E),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
//                  boxShadow: [
//                    BoxShadow(
//                        color: Color(0xFF95DFFF),
//                        blurRadius: 10.0,
//                        offset: Offset(10.0, 10.0))
//                  ]
              ),
              child: Center(),
            ),
    );
  }


}
