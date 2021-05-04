import 'package:effective_geo/functions/voc_counter.dart';
import 'package:effective_geo/functions/theme_behavior_subj.dart';
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
GetIt getKnownVocs = GetIt.instance;
GetIt getTheme = GetIt.instance;

void main() {


  getIt.registerSingleton<Counter>(Counter());   //Counter variable die sich die Anzahl der zu lernenden vocs merkt
  getKnownVocs.registerSingleton<KnownCounter>(KnownCounter());  //Counter variable die sich die Anzahl der gelernter vocs merkt
  getTheme.registerSingleton<AppThemeDataMarker>(AppThemeDataMarker()); //merkt sich aktulles Theme
  runApp(EffectiveGeo());
}

class EffectiveGeo extends StatelessWidget {
  final themeMarker = getTheme.get<AppThemeDataMarker>();
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onPanDown: (details) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: StreamBuilder(
          stream: themeMarker.themeMarkerStream$,//knownVocabCounter.knownVocabStream$,
          builder: (context, snapshot) {
            ThemeData val;
            if(!snapshot.hasData){
              print('still waiting for data...');
              val = null;
            }
            else if(snapshot.hasData){
              print('data received');
              val = snapshot.data;// aktuelles appTheme
            }
            return MaterialApp(
              title: "Effective geo" ,
              theme: val,
              //initialRoute: '/navigation',


              routes: {
                '/': (context) => Loading(),
                '/home': (context) => Home(),
                '/settings': (context) => Settings(),
                '/country_table': (context) => CountryTable(),
                '/navigation': (context) => Navigation(),
                '/flashcard': (context) => Flashcard(),

              },
            );
          },
        ),
    );
  }// l app
}