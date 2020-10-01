import 'package:bin2dec/pages/screens/bin2dec.dart';
import 'package:flutter/material.dart';

import 'managers/manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Manager manager = Manager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Bin2Dec()
    );
  }
}

