import 'package:effective_geo/functions/voc_counter.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/loading.dart';
import 'package:effective_geo/pages/settings.dart';
import 'package:effective_geo/pages/navigation.dart';
import 'package:effective_geo/pages/flashcard.dart';
import 'package:get_it/get_it.dart';

//global ServiceLocator
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<Counter>(Counter());   //Counter variable die sich die Anzahl der zu lernenden vocs merkt
  runApp(EffectiveGeo());
}

class EffectiveGeo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onPanDown: (details) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: "Effective geo",
          theme: ThemeData(
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
          ),
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