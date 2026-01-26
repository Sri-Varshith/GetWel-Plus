import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
  );
}
