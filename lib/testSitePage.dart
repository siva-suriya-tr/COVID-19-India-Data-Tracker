import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/TestSiteCard.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State {
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
                          top: 60.0,
                          left: 30.0,
                          child: Image.asset('images/invent.png',
                              fit: BoxFit.fitHeight,
                              width: 200,
                              height: 350,
                              alignment: Alignment.topCenter),
                        ),
                        Positioned(
                          top: 70.0,
                          right: 20.0,
                          child: AutoSizeText("Test your \nsymptoms. ",
                              minFontSize: 5.0,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      height: 1.2))),
                        ),
                        //Container(), // I dont know why it can't work without container
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          getTestSite(
              "COVID-19 Government Labs",
              "https://icmr.nic.in/sites/default/files/upload_documents/Govt_Labs_24042020.pdf",
              "images/testsite1.png"),
          SizedBox(
            height: 10.0,
          ),
          getTestSite(
              "COVID-19 Private Labs",
              "https://icmr.nic.in/sites/default/files/upload_documents/Pvt_Labs_24042020.pdf",
              "images/testsite2.png"),
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
