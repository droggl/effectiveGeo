import 'package:effective_geo/functions/voc_counter.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/loading.dart';
import 'package:effective_geo/pages/settings.dart';
import 'package:effective_geo/pages/navigation.dart';
import 'package:effective_geo/pages/flashcard.dart';
import 'package:get_it/get_it.dart';
import 'package:effective_geo/data/appThemeData.dart' as theme_globals;

//global ServiceLocator
GetIt getIt = GetIt.instance;
GetIt getKnownVocs = GetIt.instance;

void main() {
  print("klappt");
  getIt.registerSingleton<Counter>(Counter());   //Counter variable die sich die Anzahl der zu lernenden vocs merkt
  print("kappt iwi safe nicht");
  getKnownVocs.registerSingleton<KnownCounter>(KnownCounter());  //Counter variable die sich die Anzahl der gelernter vocs merkt
  print("klapp safe safe net");
  runApp(EffectiveGeo());
}

class EffectiveGeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme_globals.globalThemeData = theme_globals.lightThemeData;

    return GestureDetector(
        onPanDown: (details) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: "Effective geo",
          theme: theme_globals.globalThemeData,
          //initialRoute: '/navigation',


          routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/settings': (context) => Settings(),
            '/country_table': (context) => CountryTable(),
            '/navigation': (context) => Navigation(),
            '/flashcard': (context) => Flashcard(),

          },
        )
    );
  }// l app
}