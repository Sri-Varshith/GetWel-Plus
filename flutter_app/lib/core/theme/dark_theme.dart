import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
