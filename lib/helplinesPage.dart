import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/HelplineCard.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DialWidget extends StatefulWidget {
  @override
  DialWidgetState createState() => DialWidgetState();
}

class DialWidgetState extends State {
  String valnum = "Select State";
  String callNumber = "Select State";

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipPath(
            clipper: Clip(),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(int.parse("0xff000046")),
                      Color(int.parse("0xff0098CC"))
                    ]),
                image: DecorationImage(
                    image: AssetImage("images/virusspreadflip.png")),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 35.0,
                          right: 35.0,
                          child: Image.asset('images/police.png',
                              fit: BoxFit.fitHeight,
                              width: 200,
                              height: 350,
                              alignment: Alignment.topCenter),
                        ),
                        Positioned(
                          top: 70.0,
                          left: 30.0,
                          child: AutoSizeText("Help them,\nhelp us. ",
                              textAlign: TextAlign.right,
                              minFontSize: 5.0,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      height: 1.2))),
                        ),
                        //Container(), // I dont know why it can't work without container
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("All India COVID-19 Helpline", "+91-11-23978046",
              "images/customer-service-agent.png"),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            width: double.infinity,
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
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down),
                    value: valnum,
                    items: [
                      "Select State",
                      "Andaman and Nicobar Islands",
                      "Andhra Pradesh",
                      "Arunachal Pradesh",
                      "Assam",
                      "Bihar",
                      "Chandigarh",
                      "Chhattisgarh",
                      "Dadra and Nagar Haveli",
                      "Daman and Diu",
                      "Delhi",
                      "Goa",
                      "Gujarat",
                      "Haryana",
                      "Himachal Pradesh",
                      "Jammu and Kashmir",
                      "Jharkhand",
                      "Karnataka",
                      "Kerala",
                      "Ladakh",
                      "Lakshadweep",
                      "Madhya Pradesh",
                      "Maharashtra",
                      "Manipur",
                      "Meghalaya",
                      "Mizoram",
                      "Nagaland",
                      "Odisha",
                      "Puducherry",
                      "Punjab",
                      "Rajasthan",
                      "Sikkim",
                      "Tamil Nadu",
                      "Telangana",
                      "Tripura",
                      "Uttar Pradesh",
                      "Uttarakhand",
                      "West Bengal",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: AutoSizeText(
                          value,
                          minFontSize: 5.0,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      String number = getNum(value);

                      setState(() {
                        callNumber = number;
                        valnum = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  //padding: EdgeInsets.only(top:5.0),
                  child: AutoSizeText("India",
                      minFontSize: 5.0,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        //height: 1.0
                      ))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
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
                        child: Image.asset("images/state.png",
                            fit: BoxFit.fitHeight,
                            width: 105,
                            height: 100,
                            alignment: Alignment.topCenter),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 5.0,
                        child: AutoSizeText("State COVID-19 Helpline",
                            minFontSize: 5.0,
                            style: GoogleFonts.poppins(
                                //State Specific COVID-19 Helpline
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
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.only(top:5.0),
                      child: AutoSizeText(callNumber,
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
                    RaisedButton(
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
                          if (callNumber == "Select State") {
                            showSelectDialog();
                            return;
                          }
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        })
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("Police Services", "100", "images/policeman.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("Fire Services", "101", "images/firefighter.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("Ambulance Services", "102", "images/ambulance.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard(
              "National Emergency Number", "112", "images/emergency.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("Women Helpline", "1091", "images/woman.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard(
              "Senior Citizen Helpline", "1291", "images/grandma.png"),
          SizedBox(
            height: 10.0,
          ),
          getNumberCard("Child Protection Services", "1098", "images/son.png"),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  String getNum(String value) {
    switch (value) {
      case "Select State":
        return "Select State";
        break;
      case "Andaman and Nicobar Islands":
        return "03192232102";
        break;
      case "Andhra Pradesh":
        return "08662410978";
        break;
      case "Arunachal Pradesh":
        return "9436055743";
        break;
      case "Assam":
        return "6913347770";
        break;
      case "Bihar":
        return "104";
        break;
      case "Chandigarh":
        return "104";
        break;
      case "Chhattisgarh":
        return "104";
        break;
      case "Dadra and Nagar Haveli":
        return "104";
        break;
      case "Daman and Diu":
        return "104";
        break;
      case "Delhi":
        return "01122307145";
        break;
      case "Goa":
        return "104";
        break;
      case "Gujarat":
        return "104";
        break;
      case "Haryana":
        return "8558893911";
        break;
      case "Himachal Pradesh":
        return "104";
        break;
      case "Jammu and Kashmir":
        return " 01942440283";
        break;
      case "Jharkhand":
        return "104";
        break;
      case "Karnataka":
        return "104";
        break;
      case "Kerala":
        return "04712552056";
        break;
      case "Ladakh":
        return "01982256462";
        break;
      case "Lakshadweep":
        return "104";
        break;
      case "Madhya Pradesh":
        return "104";
        break;
      case "Maharashtra":
        return "02026127394";
        break;
      case "Manipur":
        return "3852411668";
        break;
      case "Meghalaya":
        return "108";
        break;
      case "Mizoram":
        return "102";
        break;
      case "Nagaland":
        return "7005539653";
        break;
      case "Odisha":
        return "9439994859";
        break;
      case "Puducherry":
        return "104";
        break;
      case "Punjab":
        return "104";
        break;
      case "Rajasthan":
        return "01412225624";
        break;
      case "Sikkim":
        return "104";
        break;
      case "Tamil Nadu":
        return "04429510500";
        break;
      case "Telangana":
        return "104";
        break;
      case "Tripura":
        return "03812315879";
        break;
      case "Uttarakhand":
        return "104";
        break;
      case "Uttar Pradesh":
        return "18001805145";
        break;
      case "West Bengal":
        return "03323412600";
        break;

      default:
        return "placeholder";
    }
  }

  Future<bool> showSelectDialog() {
    return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => new AlertDialog(
            title: new AutoSizeText(
              'Awaiting Valid Selection',
              minFontSize: 5.0,
            ),
            content: new AutoSizeText(
              'Select a State',
              minFontSize: 5.0,
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new AutoSizeText(
                  'OK',
                  minFontSize: 5.0,
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height - 65);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height);
    var secondEndPoint = Offset(size.width, size.height - 30.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
