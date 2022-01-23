// @dart=2.9
import 'dart:developer';

import 'package:flutter/material.dart';
import 'controller.dart';
import 'class.dart';
import 'assets.dart';
import 'entry.dart';
import 'map.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crime Mapping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Entry(),
    );
  }
}
