import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'count.dart';
Widget getFuture(String uri,String path,double fontsize,Color colorNeeded) {
  return FutureBuilder<String>(
      future:getCount(uri,path) ,
      //initialData: "...",
      builder:(BuildContext context, AsyncSnapshot<String> text){
        if (text.connectionState != ConnectionState.done){
          //return JumpingDotsProgressIndicator(numberOfDots: 3,color: Colors.deepOrange,fontSize: 50.0,milliseconds: 500,);
          return Container(
            width: 50.0,
            child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorNeeded),),
          );
        }
        else{
          double fontSize = fontsize;
          String lol = text.data;
          return Center(
            child: Text("$lol  ", style: GoogleFonts.poppins(fontSize: fontSize,color: colorNeeded,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          );
        }
      });
}
