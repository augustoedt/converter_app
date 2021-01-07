import 'package:bin2dec/managers/converter_manager.dart';
import 'package:bin2dec/services/binary_converter_service.dart';
import 'package:bin2dec/services/url_converter_service.dart';
import 'package:bin2dec/ui/screens/convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/theme_service.dart';

void main(){
  // final getIt = GetIt.instance;
  // final prefs = await SharedPreferences.getInstance();

  GetIt.I.registerSingleton<UrlConverterService>(UrlConverterService());
  GetIt.I.registerSingleton<BinaryConverterService>(BinaryConverterService());
  GetIt.I.registerSingleton<ConverterManager<BinaryConverterService>>(ConverterManager<BinaryConverterService>());
  GetIt.I.registerSingleton<ConverterManager<UrlConverterService>>(ConverterManager<UrlConverterService>());
  // getIt.registerSingleton<ThemeService>(ThemeService(prefs));
  // getIt.registerSingleton<ThemeManager>(ThemeManager());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeService.themeMap[SelectedTheme.dark],
        home: ConverterScreen<UrlConverterService>()
    );
  }
}

void registerViewModel(SharedPreferences prefs){

}

