import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DialWidget extends StatefulWidget {
  @override
  DialWidgetState createState() => DialWidgetState();
}
class DialWidgetState extends State {
  Widget build(BuildContext context) {
    return  RaisedButton(
      child: Text("dail"),
      onPressed:
        () async {
          const url = "tel:1234567";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }

      },
    );

  }
}