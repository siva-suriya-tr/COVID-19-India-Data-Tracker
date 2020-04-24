import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';
Widget getBloodInfo(String name, String link)
{
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric( horizontal: 5.0,vertical: 10),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color(0xFFE5E5E5),   //0xFFE5E5E5
      ),
    ),
    child: Row(
      children: <Widget>[
        AutoSizeText(name,
            style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              //height: 1.0
            ))),
        Spacer(),
        RaisedButton(
          color: Colors.blue,
          onPressed:  () async {
            var url = link;
            if (await canLaunch(url)) {
              await launch(url);
            }
            else {
              throw 'Could not launch $url';
            }
          },
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
          child: AutoSizeText("Go",style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                //height: 1.0
              ))),),
      ],
    ),
  );
}
