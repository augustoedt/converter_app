
import 'dart:async';

import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ThemeManager{
  ThemeData theme;
  final _themeController = StreamController<ThemeData>();

  Stream<ThemeData> get themeStream => _themeController.stream;

  ThemeManager(){
    theme = GetIt.I.get<ThemeService>().getTheme();
  }

  void changeTheme() async {
    theme = GetIt.I.get()<ThemeService>().getTheme();
    _themeController.sink.add(theme);
  }



  dispose(){
    _themeController.close();
  }
}