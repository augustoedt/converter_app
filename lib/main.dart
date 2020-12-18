import 'package:bin2dec/pages/screens/bin2dec.dart';
import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'managers/manager.dart';
import 'pages/screens/converter_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Manager manager = Manager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeService.darkTheme,
      home: ConvertSelectionScreen()
    );
  }
}

