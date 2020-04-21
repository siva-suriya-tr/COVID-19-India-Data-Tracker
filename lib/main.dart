import 'package:flutter/material.dart';
import 'dart:async';
import 'layout.dart';
import 'twitter.dart';
import 'dail.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF262626)),
        fontFamily:'Roboto',
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
  double bottomNavBarHeight = 60;
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue, labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(MdiIcons.twitter, "Recent Tweets", Colors.orange, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.library_books, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
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
    return new WillPopScope(child: Scaffold(
        backgroundColor: Color(int.parse("0xffFFFFFF")),
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
        return ViewWidget();
        break;
      case 2:
        return DialWidget();
        break;
      case 3:
        return ViewWidget();
        break;
    }
  }
  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          //print(_navigationController.value);
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



