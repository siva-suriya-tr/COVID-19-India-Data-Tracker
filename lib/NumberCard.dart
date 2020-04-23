import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getNumberCard(String barNum,String callNumber)
{
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric( horizontal: 20,vertical: 10),
    height: 95,
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
        Text(barNum,style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                height: 1.0
            ))),
        SizedBox(height: 5,),
        Row(
          children: <Widget>[
            Container(
              //padding: EdgeInsets.only(top:5.0),
              child: Text(callNumber,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        //height: 1.0
                      ))),
            ),
            Spacer(),
            RaisedButton(
                color: Colors.blue,
                child: Text("Call",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          //height: 1.0
                        ))),
                onPressed:  () async {
                  var url = "tel:$callNumber";
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                  else {
                    throw 'Could not launch $url';
                  }
                }
            )
          ],
        )


      ],
    ),
  );
}
