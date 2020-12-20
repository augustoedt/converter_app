import 'package:bin2dec/Service/converter_service.dart';
import 'package:bin2dec/managers/binary_manager.dart';
import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'managers/manager.dart';
import 'pages/screens/convert_screen.dart';

void main() {
  registerViewModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Manager manager = Manager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeService.darkTheme,
      home: ConverterScreen()
    );
  }
}

void registerViewModel(){
  GetIt.I.registerSingleton<ConverterService>(ConverterService());
  GetIt.I.registerSingleton<BinaryManager>(BinaryManager());
}

