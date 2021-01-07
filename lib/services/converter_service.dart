import 'dart:math';

import 'package:flutter/material.dart';

abstract class ConverterService{
  Future<String> converter(String input, bool inverted);
}

