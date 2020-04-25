import 'widgets/Bloodcard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DonateWidget extends StatefulWidget {
  @override
  DonateWidgetState createState() => DonateWidgetState();
}

class DonateWidgetState extends State {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          top: 45.0,
                          left: 0.0,
                          child: Image.asset('images/donate.png',
                              fit: BoxFit.fitHeight,
                              width: 340,
                              height: 380,
                              alignment: Alignment.topCenter),
                        ),
                        Positioned(
                          top: 30.0,
                          right: 5.0,
                          child: AutoSizeText("Do your part.\nDonate. ",
                              minFontSize: 5.0,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26.0,
                                      height: 1.2))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            height: 375,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFE5E5E5), //0xFFE5E5E5
              ),
            ),
            child: Column(
              //color: Colors.cyan,
              //height: 120.0,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      MdiIcons.bloodBag,
                      color: Colors.blue,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    AutoSizeText("Major blood donation organizations",
                        maxLines: 1,
                        minFontSize: 5.0,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          //height: 1.0
                        ))),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                getBloodInfo("Indian Red Cross Society",
                    "https://indianredcross.org/ircs/ircsbloodbanks"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo("Rotary Blood Bank ",
                    "http://rotarybloodbank.org/volunteer/"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo(
                    "Friends2support", "http://www.friends2support.org/"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo(
                    "Sankalp India Foundation", "http://www.sankalpindia.net/"),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFE5E5E5), //0xFFE5E5E5
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText(
                            "Most Government and Private hospitals also maintain Blood Banks.\nContact a hospital nearby for more details.",
                            minFontSize: 5.0,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              //height: 1.0
                            ))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            height: 330,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFE5E5E5), //0xFFE5E5E5
              ),
            ),
            child: Column(
              //color: Colors.cyan,
              //height: 120.0,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      MdiIcons.cash,
                      color: Colors.blue,
                      size: 22.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    AutoSizeText("Monetary Donation Campaigns",
                        maxLines: 1,
                        minFontSize: 5.0,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          //height: 1.0
                        ))),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                getBloodInfo("PM Cares Fund",
                    "https://www.pmcares.gov.in/en/web/contribution/donate_india"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo("WHO COVID-19 Relief Fund",
                    "https://covid19responsefund.org/"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo("Indian Red Cross Society",
                    "https://www.indianredcross.org/ircs/COVID19Donate"),
                SizedBox(
                  height: 5.0,
                ),
                getBloodInfo("GoFundMe Links",
                    "https://www.gofundme.com/mvc.php?route=homepage_norma/search&term=Corona%20India"),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFE5E5E5), //0xFFE5E5E5
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText("Volunteer at your local NGO.",
                            maxLines: 1,
                            minFontSize: 5.0,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              //height: 1.0
                            ))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
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
