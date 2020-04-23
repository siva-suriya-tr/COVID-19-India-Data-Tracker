import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CounterRow.dart';
Widget buildLayout() {
  var now = new DateTime.now();
  var prevday = new DateTime(now.year, now.month, now.day - 1);
  var formatmonth = new DateFormat('MM');
  var formatyear = new DateFormat('y');
  var formatday = new DateFormat('d');
  String month = formatmonth.format(prevday);
  String day = formatday.format(prevday);
  String year = formatyear.format(prevday);
  String time = DateFormat.yMEd().add_jms().format(DateTime.now());
  return new ListView(
    children: <Widget>[
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipPath(
              clipper: Clip(),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(int.parse("0xff000046")),
                        Color(int.parse("0xff0098CC"))
                      ]),
                  image: DecorationImage(
                      image: AssetImage("images/virusspread.png")),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 5.0,
                            left: 50.0,
                            child: Image.asset('images/doctor.png',
                                fit: BoxFit.fitHeight,
                                width: 150,
                                height: 500,
                                alignment: Alignment.topCenter),
                          ),
                          Positioned(
                            top: 75.0,
                            right: 20.0,
                            child: Text("Stay in.\nStay safe. ",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.0,
                                        height: 1.0))),
                          ),
                          //Container(), // I dont know why it can't work without container
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric( horizontal: 20,vertical: 10),
              height: 122,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE5E5E5),   //0xFFE5E5E5
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.my_location,color: Colors.blue,),
                  SizedBox(width: 10),
                  Container(
                    //padding: EdgeInsets.only(top:5.0),
                    child: Text("India",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                //height: 1.0
                            ))),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 15.0,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: 'Last Updated : \n',style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    //height: 1.0
                                  ))),
                              new TextSpan(text: '$time', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    //height: 1.0
                                  ))),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 15.0,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: 'Source : \n',style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    //height: 1.0
                                  ))),
                              new TextSpan(text: 'MoHFW.gov.in', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    //height: 1.0
                                  ))),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height:10.0,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric( horizontal: 0,vertical: 10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE5E5E5),   //0xFFE5E5E5
                ),
              ),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //uri, path, fontsize,colorNeeded,text,color
                  loadCounter("https://www.mohfw.gov.in/index.html","#site-dashboard > div > div > div > div > ul > li.bg-blue > strong",30.0,"Active",Colors.orange),
                  loadCounter("https://www.mohfw.gov.in/index.html","#site-dashboard > div > div > div > div > ul > li.bg-red > strong", 30.0,"Dead",Colors.red),
                  loadCounter("https://www.mohfw.gov.in/index.html", "#site-dashboard > div > div > div > div > ul > li.bg-green > strong", 30.0,"Recovered",Colors.green),
                ],
              ),
            ),
                SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric( horizontal: 0,vertical: 10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE5E5E5),   //0xFFE5E5E5
                ),
              ),
              child: loadCounter("https://www.mohfw.gov.in/index.html","#state-data > div > div > div > div > table > tbody > tr > td[align] > strong",30.0,"Total Cases",Colors.blue),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric( horizontal: 0,vertical: 10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE5E5E5),   //0xFFE5E5E5
                ),
              ),
              child: loadCounter("https://www.worldometers.info/coronavirus/country/india/","#newsdate$year-$month-$day > div > div > ul > li > strong",20.0,"Observed on $day-$month-$year alone",Colors.purple),
            ),
          ],
        ),
      ),
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

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
