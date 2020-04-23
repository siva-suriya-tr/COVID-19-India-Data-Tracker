import 'package:flutter/material.dart';
import 'dart:async';
import 'layout.dart';
import 'twitter.dart';
import 'dial.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

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
        fontFamily:'Poppins',
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
    new TabItem(Icons.home, "Statistics", Colors.blue, labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(Icons.contacts, "Helplines", Colors.blue, labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
    new TabItem(MdiIcons.twitter, "Recent Tweets", Color(0xff0098CC), labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
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
    ) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(int.parse("0xff000046")));
    return new WillPopScope(child: Scaffold(
        appBar: AppBar(
            title: Row(
              children: <Widget>[
                Image.asset(
                  'images/virus.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Text("  COVID-19 Tracker and Helpkit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),),
              ],
            )
        ),
        bottomNavigationBar: bottomNav(),
        body: new RefreshIndicator(
          child: bodyContainer(),
          onRefresh: handleRefresh,
        )
    ) ,
        onWillPop: _onWillPop);
  }
  Future<Null> handleRefresh() async
  {
    await new Future.delayed(new Duration(seconds: 2));
    setState(() {
      buildLayout();
    });
  }
  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
      return buildLayout();
      break;
      case 1:
        return DialWidget();
        break;
      case 2:
        return DialWidget();
        break;
      case 3:
        return ViewWidget();
        break;
      default: return Text("Placeholder");
    }
  }
  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: 50.0,
      iconsSize: 30.0,
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



