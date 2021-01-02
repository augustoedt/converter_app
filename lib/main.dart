import 'package:bin2dec/Service/converter_service.dart';
import 'package:bin2dec/managers/binary_manager.dart';
import 'package:bin2dec/managers/theme_manager.dart';
import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'pages/screens/convert_screen.dart';

void main() {
  registerViewModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final themeCommand = watchX((ThemeManager x) => x.updateThemeCmd);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeCommand,
      home: ConverterScreen()
    );
  }
}

void registerViewModel(){
  GetIt.I.registerSingleton<ConverterService>(ConverterService());
  GetIt.I.registerSingleton<ThemeService>(ThemeService());
  GetIt.I.registerSingleton<ThemeManager>(ThemeManager());
  GetIt.I.registerSingleton<BinaryManager>(BinaryManager());
}

