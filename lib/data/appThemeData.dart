library effective_geo.theme_globals;

import 'package:flutter/material.dart';

ThemeData globalThemeData;

ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.grey[850],
    bottomAppBarColor: Colors.grey[850],  //Farbe für unteren Balken bei abfrage (hard/good/easy)
    brightness: Brightness.dark,
    accentColor: Colors.grey[900],
    cardColor: Colors.grey[700],
    buttonColor: Colors.amber,  //wird für alle Texte verwendet
    indicatorColor: Colors.amber,//wird für Progress Balken in home verwendet
   // cursorColor: Colors.amber,
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

        ),
        headline4: TextStyle(
          fontSize: 18,
          color: Colors.amber,
          letterSpacing: 1.5,
        ),
        headline5: TextStyle(
          fontSize: 15,
          color: Colors.amber,
          letterSpacing: 1.5,
        )
    ),

);

ThemeData lightThemeData = ThemeData(
    primaryColor: Colors.white,
    bottomAppBarColor: Colors.grey[800],  //Farbe für unteren Balken bei abfrage (hard/good/easy)
    brightness: Brightness.light,
    accentColor: Colors.grey,
    cardColor: Colors.grey[500],
    buttonColor: Colors.black,  //wird für alle Texte verwendet
    indicatorColor: Colors.grey,//wird für Progress Balken in home verwendet
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

        ),
      headline4: TextStyle(
        fontSize: 20,
        color: Colors.black,
        letterSpacing: 1.5,
      ),
        headline5: TextStyle(
          fontSize: 15,
          color: Colors.black,
          letterSpacing: 1.5,
        )
    )
);

ThemeData greenThemeData = ThemeData(
    primaryColor: Colors.lightGreenAccent,
    bottomAppBarColor: Colors.grey[850],  //Farbe für unteren Balken bei abfrage (hard/good/easy)
    brightness: Brightness.dark,
    accentColor: Colors.lightGreen,
    cardColor: Colors.lightGreenAccent, //noch heller
    buttonColor: Colors.green,   //wird für alle Texte verwendet
    indicatorColor: Colors.amber,//wird für Progress Balken in home verwendet
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

        ),
        headline4: TextStyle(
          fontSize: 18,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
        headline5: TextStyle(
          fontSize: 15,
          color: Colors.amber,
          letterSpacing: 1.5,
        )
    )
);