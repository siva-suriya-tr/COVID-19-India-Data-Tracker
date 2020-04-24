import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
Widget getPreventionCard(String title, String text, String url,bool flip)
{
  if(flip == true) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
      height: 122,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFE5E5E5), //0xFFE5E5E5
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            margin: EdgeInsets.only(right: 5.0,left: 5.0),
            child: Image.asset(url,
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
                alignment: Alignment.topCenter),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: AutoSizeText(title, style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        height: 1.0
                    ))),
              ),
              SizedBox(height: 6.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                width: 220,
                child: AutoSizeText("    $text",
                    overflow: TextOverflow.visible,
                    minFontSize: 9.0,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            height: 1.1
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }
      else {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.symmetric( horizontal: 5,vertical: 10),
      height: 122,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFE5E5E5),   //0xFFE5E5E5
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: AutoSizeText(title,style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        height: 1.0
                    ))),
              ),
              SizedBox(height: 6.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                width: 220,
                child: AutoSizeText("    $text",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.justify,
                    minFontSize: 9.0,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            height: 1.1
                        ))),
              )
            ],
          ),
          Container(
            width: 100,
            margin: EdgeInsets.only(left: 10.0),
            child: Image.asset(url,
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
                alignment: Alignment.topCenter),
          ),
        ],
      ),
    );
  }

}