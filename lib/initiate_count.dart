import 'package:flutter/material.dart';
import 'count.dart';
Widget getFuture(String uri,String path,double fontsize) {
  return FutureBuilder<String>(
      future:getCount(uri,path) ,
      initialData: "...",
      builder:(BuildContext context, AsyncSnapshot<String> text){
        if (text.connectionState != ConnectionState.done){
          //return JumpingDotsProgressIndicator(numberOfDots: 3,color: Colors.deepOrange,fontSize: 50.0,milliseconds: 500,);
          return Container(
            width: 50.0,
            child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
          );
        }
        else{
          double fontSize = fontsize;
          String lol = text.data;
          return Text("$lol  ", style: TextStyle(fontSize: fontSize,color: Colors.white,fontWeight: FontWeight.bold));
        }
      });
}