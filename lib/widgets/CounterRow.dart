import 'initiate_count.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget loadCounter(
    String uri, String path, double fontsize, String text, Color colorNeeded) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(6),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorNeeded.withOpacity(0.26),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorNeeded,
            border: Border.all(
              color: colorNeeded,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      getFuture(uri, path, fontsize, colorNeeded),
      Center(
        child: AutoSizeText(
          text,
          minFontSize: 5.0,
          style: GoogleFonts.poppins(
              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
