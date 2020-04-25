import 'package:corona_tracker/donatePage.dart';
import 'package:corona_tracker/symptomsPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'homePage.dart';
import 'twitterPage.dart';
import 'helplinesPage.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'testSitePage.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xff000046)),
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(title: 'COVID-19 Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 50;
  List<TabItem> tabItems = List.of([
    new TabItem(
      Icons.home,
      "Home",
      Colors.blue,
      labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
    new TabItem(MdiIcons.alertDecagram, "Tips", Colors.blue,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(MdiIcons.hospitalBuilding, "Test Sites", Colors.blue,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(Icons.contacts, "Helplines", Colors.blue,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(MdiIcons.water, "Donate", Colors.blue,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(MdiIcons.twitter, "Tweets", Colors.blue,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
  ]);
  CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(int.parse("0xff000046")));
    return new WillPopScope(
        child: Scaffold(
            appBar: AppBar(
                title: Row(
              children: <Widget>[
                Image.asset(
                  'images/virus.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                AutoSizeText(
                  "  COVID-19 Tracker and Helpkit",
                  minFontSize: 5.0,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
              ],
            )),
            bottomNavigationBar: bottomNav(),
            body: new RefreshIndicator(
              child: bodyContainer(),
              onRefresh: handleRefresh,
            )),
        onWillPop: _onWillPop);
  }

  Future<Null> handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    setState(() {
      mainLayout();
    });
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return mainLayout();
        break;
      case 1:
        return SymptomWidget();
        break;
      case 2:
        return TestWidget();
        break;
      case 3:
        return DialWidget();
        break;
      case 4:
        return DonateWidget();
        break;
      case 5:
        return ViewWidget();
        break;
      default:
        return AutoSizeText(
          "Placeholder",
          minFontSize: 5.0,
        );
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: 50.0,
      iconsSize: 23.0,
      circleStrokeWidth: 2.0,
      circleSize: 40.0,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          //print(_navigationController.value);\
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
