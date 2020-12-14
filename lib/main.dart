import 'package:flutter/material.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/loading.dart';
import 'package:effective_geo/pages/settings.dart';
import 'package:effective_geo/pages/navigation.dart';
import 'package:effective_geo/pages/flashcard.dart';

void main() => runApp(EffectiveGeo());

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
            primaryColor: Colors.grey[900],
            brightness: Brightness.dark,
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