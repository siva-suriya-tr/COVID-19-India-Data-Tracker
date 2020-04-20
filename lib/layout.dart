import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'initiate_count.dart';
Widget buildLayout() {
  var now = new DateTime.now();
  var prevday = new DateTime(now.year, now.month , now.day - 1);
  var formatmonth = new DateFormat('MM');
  var formatyear = new DateFormat('y');
  var formatday = new DateFormat('d');
  String month = formatmonth.format(prevday);
  String day = formatday.format(prevday);
  String year = formatyear.format(prevday);
  String time = DateFormat.yMEd().add_jms().format(DateTime.now());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
          decoration: BoxDecoration(color: Color(int.parse("0xff2CA2CA")),borderRadius:BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.fromLTRB(12.5, 15.0, 12.5, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                child: getFuture("https://www.mohfw.gov.in/index.html","#state-data > div > div > div > div > table > tbody > tr > td[align] > strong",45.0),
              ),
              Container(
                decoration: BoxDecoration(color: Color(int.parse("0xff187B96")),borderRadius:BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        margin:EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0) ,
                        child: Row(
                          children: <Widget>[
                            Text('TOTAL CASES    ',style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),//total cases
                            Spacer(),
                            Image.asset(
                              'images/up.png',
                              fit: BoxFit.contain,
                              height: 24,
                            ),
                            Text(" "),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
                              child: getFuture("https://www.worldometers.info/coronavirus/country/india/","#newsdate$year-$month-$day > div > div > ul > li > strong",20.0),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Color(int.parse("0xff00AD28")),borderRadius:BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.fromLTRB(12.5, 6.5, 4, 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                        child: getFuture("https://www.mohfw.gov.in/index.html","#site-dashboard > div > div > div > div > ul > li.bg-green > strong",45.0),//recovered
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(int.parse("0xff009D00")),borderRadius:BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: Text('RECOVERED',style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                              margin:EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0), //total cases
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Color(int.parse("0xffC81F17")),borderRadius:BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.fromLTRB(2.5, 6.5, 12.5, 6.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                        child: getFuture("https://www.mohfw.gov.in/index.html","#site-dashboard > div > div > div > div > ul > li.bg-red > strong",45.0),//deceased
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(int.parse("0xffAD0000")),borderRadius:BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: Text('DECEASED',style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                              margin:EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0), //total cases
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
      Container(
          decoration: BoxDecoration(color: Color(int.parse("0xffE6AE0E")),borderRadius:BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.fromLTRB(12.5, 0.0, 12.5, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                child: getFuture("https://www.mohfw.gov.in/index.html","#site-dashboard > div > div > div > div > ul > li.bg-blue > strong",45.0),//activecases
              ),
              Container(
                decoration: BoxDecoration(color: Color(int.parse("0xffAD7300")),borderRadius:BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin:EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0) ,
                      child: Text('ACTIVE CASES',style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                      //total cases
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
      Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text("Last Updated: $time"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0),
            child: Center(
              child: Text("The new cases counter displays the increase in number of recorded cases observed on $day/$month/$year alone",textAlign: TextAlign.center,),
            ),
          ),

        ],
      )
    ],
  );
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

