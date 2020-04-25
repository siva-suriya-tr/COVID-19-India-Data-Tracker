import 'widgets/PreventionCard.dart';
import 'widgets/SymptomCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SymptomWidget extends StatefulWidget {
  @override
  SymptomWidgetState createState() => SymptomWidgetState();
}

class SymptomWidgetState extends State {
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
                    image: AssetImage("images/virusspreadflip.png")),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          right: 20.0,
                          child: Image.asset('images/symptomDoc.png',
                              fit: BoxFit.fitHeight,
                              width: 200,
                              height: 450,
                              alignment: Alignment.topCenter),
                        ),
                        Positioned(
                          top: 65.0,
                          left: 15.0,
                          child: AutoSizeText("Keep track of\nyourself. ",
                              minFontSize: 5.0,
                              textAlign: TextAlign.right,
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
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            height: 1010,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFE5E5E5), //0xFFE5E5E5
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText("Common Symptoms",
                    minFontSize: 5.0,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      //height: 1.0
                    ))),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  //color: Colors.blue,
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      getSymptom("Fever", "images/fever.png"),
                      Spacer(),
                      getSymptom("Fatigue", "images/pain.png"),
                      Spacer(),
                      getSymptom("Cough", "images/cough.png"),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  //color: Colors.blue,
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      getSymptom("Body Ache", "images/pain1.png"),
                      SizedBox(
                        width: 20.0,
                      ),
                      getSymptom("Runny Nose", "images/runnynose.png"),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AutoSizeText("Preventive Measures",
                    minFontSize: 5.0,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      //height: 1.0
                    ))),
                SizedBox(
                  height: 10.0,
                ),
                getPreventionCard(
                    "Wash your hands ",
                    "Wash your hands with soap and water for at least 20 seconds especially after you "
                        "have been in a public place, or after coughing, or sneezing. If soap and "
                        "water are not readily available, use a hand sanitizer. Avoid touching your face.",
                    "images/handwash.png"),
                SizedBox(
                  height: 10.0,
                ),
                getPreventionCard(
                    "Use Facemasks",
                    "You could spread COVID-19 to others even if you do not feel sick. Everyone should wear "
                        "a mask out in public.The mask is meant to protect other people in case you are infected."
                        "The mask is not a substitute for social distancing.",
                    "images/mask.png"),
                SizedBox(
                  height: 10.0,
                ),
                getPreventionCard(
                    "Social Distancing",
                    "Stay at least 6 feet from other people. Stay out of crowded places and mass gatherings. "
                        "Keeping space between you and others is one of the best tools we have to avoid being "
                        "exposed to the virus and slowing its spread across the country.",
                    "images/stayhome.png"),
                SizedBox(
                  height: 10.0,
                ),
                getPreventionCard(
                    "Clean and Disinfect",
                    "Clean and disinfect frequently touched surfaces daily. This includes tables, "
                        "doorknobs, light switches, handles, desks, phones, keyboards, toilets, faucets, and s"
                        "inks. Use detergent or soap and water prior to disinfection.",
                    "images/clean.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height - 65);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height);
    var secondEndPoint = Offset(size.width, size.height - 30.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
