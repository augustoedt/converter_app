import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';

class ThemeManager{
  Command<void, ThemeData> updateThemeCmd;
  Command<void, void> switchThemeCmd;

  ThemeManager(){
    updateThemeCmd = Command.createAsyncNoParam(
        (){
          return GetIt.I<ThemeService>().getTheme();},
        ThemeService.themeMap[CurrentTheme.light]
    );

    switchThemeCmd = Command.createAsyncNoParamNoResult(() async {
      await GetIt.I<ThemeService>().switchTheme();
      updateThemeCmd.execute();
    });
  }

}