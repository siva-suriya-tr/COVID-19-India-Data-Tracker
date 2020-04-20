import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget twitterFeed(double width,double height)
{
  String lol = "https://twitter.com/ICMRDELHI";
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  return Container(
    width: width,
    height:2300,

        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: lol,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
            ),
          ],
        )


  );

}
