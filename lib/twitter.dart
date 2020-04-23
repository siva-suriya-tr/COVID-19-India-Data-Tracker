import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewWidget extends StatefulWidget {
  @override
  ViewWidgetState createState() => ViewWidgetState();
}
class ViewWidgetState extends State {

  bool viewVisible = false;
  Color whoColor = Colors.blue;
  Color mohfwColor = Colors.white;
  Color icmrColor = Colors.white;
  Color pibColor = Colors.white;
  void changeWidget() {
    setState(() {
      viewVisible = !viewVisible;
    });
  }
  void who (){
    _controller.loadUrl("https://twitter.com/WHO");
    setState(() {
      whoColor = Colors.blue;
      mohfwColor = Colors.white;
      icmrColor = Colors.white;
      pibColor = Colors.white;
      viewVisible = !viewVisible;
    });

  }
  void mohfw() {
    _controller.loadUrl("https://twitter.com/MoHFW_INDIA");
    setState(() {
      whoColor = Colors.white;
      mohfwColor = Colors.blue;
      icmrColor = Colors.white;
      pibColor = Colors.white;
      viewVisible = !viewVisible;
    });
  }
  void icmr() {
    _controller.loadUrl("https://twitter.com/ICMRDELHI");
    setState(() {
      whoColor = Colors.white;
      mohfwColor = Colors.white;
      icmrColor = Colors.blue;
      pibColor = Colors.white;
      viewVisible = !viewVisible;
    });
  }
  void pib(){
    _controller.loadUrl("https://twitter.com/PIBFactCheck");
    setState(() {
      whoColor = Colors.white;
      mohfwColor = Colors.white;
      icmrColor = Colors.white;
      pibColor = Colors.blue;
      viewVisible = !viewVisible;
    });
  }

  WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    //double height = queryData.size.height;

    //final Completer<WebViewController> _controller = Completer<WebViewController>();
    //WebViewController _controller;
    return Container(
        width: width,
        height:2300,
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: "https://twitter.com/WHO",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                //_controller.complete(webViewController);
                _controller = webViewController;
              },
              navigationDelegate: (action) {
                if (action.url == "https://stackoverflow.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstackoverflow.com%2f") {
                  return NavigationDecision.prevent;
                }
                else {
                  return NavigationDecision.navigate;
                }
              },
              debuggingEnabled: true,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.black, // inkwell color
                        child: Container(
                          child: SizedBox(width: 40, height: 40, child: Icon(Icons.menu,color: Colors.blue,)),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 3, color: Colors.blue)
                          ),
                        ),
                        onTap: () {
                          changeWidget();
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: viewVisible,
                    child:
                    Container(
                      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      decoration: BoxDecoration( color: Colors.white,borderRadius:BorderRadius.circular(10.0), border: Border.all(color: Colors.blue,width: 3.0) ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Container(
                              child: Text("WHO"),
                            ),
                            color: whoColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                              who();// WHO
                            },
                          ),

                          RaisedButton(
                            child: Container(
                              child: Text("MoHFW"),
                            ),
                            color: mohfwColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                              mohfw(); // MoFHW
                            },
                          ),
                          RaisedButton(
                            child: Container(
                              child: Text("ICMR"),
                            ),
                            color: icmrColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                             icmr(); // ICMR
                            },
                          ),
                          RaisedButton(
                            child: Container(
                              child: Text("PIB"),
                            ),
                            color: pibColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                              pib(); // PIB
                            },
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ],
        )
    );
  }
}