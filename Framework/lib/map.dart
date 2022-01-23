import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Map extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UK POLICE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Flutter'),
        ),
        body: WebView(
          initialUrl: "https://google.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}