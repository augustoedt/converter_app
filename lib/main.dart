import 'package:bin2dec/ui/screens/convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managers/binary_manager.dart';
import 'managers/theme_manager.dart';
import 'services/converter_service.dart';
import 'services/theme_service.dart';

void main(){
  // final getIt = GetIt.instance;
  // final prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<ConverterService>(ConverterService());
  GetIt.I.registerSingleton<BinaryManager>(BinaryManager());
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
        home: ConverterScreen()
    );
  }
}

void registerViewModel(SharedPreferences prefs){

}

