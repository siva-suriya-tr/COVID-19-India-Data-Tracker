import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
Widget getSymptom(String name,String url)
{
  return Container(
    //margin: EdgeInsets.symmetric(horizontal: 2),
    padding: EdgeInsets.symmetric( horizontal: 15,vertical: 5),
    //height: 40,
    //width: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color(0xFFE5E5E5),   //0xFFE5E5E5
         ),
    ),
    child: Column(
      children: <Widget>[
        Spacer(),
        Container(
          child: Image.asset(url,
              fit: BoxFit.fitHeight,
              width: 50,
              height: 50,
              alignment: Alignment.topCenter),
        ),
        Spacer(),
        AutoSizeText(name,style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                height: 1.0
            ))),
        Spacer(),
      ],
    ),
  );
}