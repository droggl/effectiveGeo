library effective_geo.theme_globals;

import 'package:flutter/material.dart';

ThemeData globalThemeData;

ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.grey[850],
    brightness: Brightness.dark,
    accentColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    buttonColor: Colors.amber,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: Colors.amber,
          letterSpacing: 1.5,
        ),
        headline2: TextStyle(
          fontSize: 23,
          color: Colors.amber,
          letterSpacing: 1.5,
        ),
        headline3: TextStyle(
          fontSize: 23,
          color: Colors.amber,
          letterSpacing: 1.5,

        )
    )
);

ThemeData lightThemeData = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    accentColor: Colors.white38,
    cardColor: Colors.grey[800],
    buttonColor: Colors.black,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
        headline2: TextStyle(
          fontSize: 23,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
        headline3: TextStyle(
          fontSize: 23,
          color: Colors.black,
          letterSpacing: 1.5,

        )
    )
);

ThemeData greenThemeData = ThemeData(
    primaryColor: Colors.lightGreenAccent,
    brightness: Brightness.dark,
    accentColor: Colors.lightGreen,
    cardColor: Colors.lightGreenAccent, //noch heller
    buttonColor: Colors.green,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: Colors.green,
          letterSpacing: 1.5,
        ),
        headline2: TextStyle(
          fontSize: 23,
          color: Colors.green,
          letterSpacing: 1.5,
        ),
        headline3: TextStyle(
          fontSize: 23,
          color: Colors.green,
          letterSpacing: 1.5,

        )
    )
);