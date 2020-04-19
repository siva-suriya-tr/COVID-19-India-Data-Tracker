import 'package:flutter/material.dart';
import 'dart:async';
import 'layout.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(int.parse("0xffD9D9D9")),
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
        body: new RefreshIndicator(
          child: new ListView(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildLayout(),],),)],),
          onRefresh: handleRefresh,
        ) );
  }
  Future<Null> handleRefresh() async
  {
    await new Future.delayed(new Duration(seconds: 2));
    setState(() {
      buildLayout();
    });
  }
}



