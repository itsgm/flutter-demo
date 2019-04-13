import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomeWebview extends StatefulWidget{

  String message;
  String title;
  HomeWebview({
    Key key,
    @required this.message,
    @required this.title,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return new HomeWebviewState();
  }
}

class HomeWebviewState extends State<HomeWebview>{

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: widget.message,
      appBar: new AppBar(
        elevation: 0.4,
        title: new Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }

}