import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget getNumberCard(String barNum, String callNumber, String imgPath) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    height: 205,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color(0xFFE5E5E5), //0xFFE5E5E5
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 130,
          child: Stack(
            children: <Widget>[
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(int.parse("0xff000046")),
                        Color(int.parse("0xff0098CC"))
                      ]),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("images/virusspread.png")),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Image.asset(imgPath,
                    fit: BoxFit.fitHeight,
                    width: 115,
                    height: 100,
                    alignment: Alignment.topCenter),
              ),
              Positioned(
                left: 10.0,
                bottom: 5.0,
                child: AutoSizeText(barNum,
                    maxLines: 1,
                    minFontSize: 5.0,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            height: 1.0))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: AutoSizeText(callNumber,
                  maxLines: 1,
                  minFontSize: 5.0,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    //height: 1.0
                  ))),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: RaisedButton(
                  color: Colors.blue,
                  child: AutoSizeText("Call",
                      minFontSize: 5.0,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        //height: 1.0
                      ))),
                  onPressed: () async {
                    var url = "tel:$callNumber";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
            )
          ],
        )
      ],
    ),
  );
}
