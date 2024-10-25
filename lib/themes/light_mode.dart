import 'package:flutter/material.dart';



ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  )
);


ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade300,
    secondary: Colors.grey,
    inversePrimary: Colors.grey.shade200,
  )
);