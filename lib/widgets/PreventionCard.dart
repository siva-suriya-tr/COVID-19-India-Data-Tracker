import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget getPreventionCard(String title, String text, String url) {

    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 0),
      //padding: EdgeInsets.only(top: 20),
      height: 155,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFE5E5E5), //0xFFE5E5E5
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Spacer(),
              Container(
                child: AutoSizeText(title,
                    minFontSize: 5.0,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            height: 1.0))),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 5.0),
                width: 240,
                height: 100,
                child: AutoSizeText("    $text",
                    minFontSize: 5.0,
                    overflow: TextOverflow.visible,
                    maxLines: 6,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey, fontSize: 10.0, height: 1.1))),
              ),
              //Spacer(),
            ],
          ),
          Spacer(),
          Container(
            //width: 100,
            //margin: EdgeInsets.only( left: 5),
            child: Image.asset(url,
                fit: BoxFit.fitHeight,
                width: 70,
                height: 70,
                alignment: Alignment.topCenter),
          ),
          Spacer(),
        ],
      ),
    );

}
