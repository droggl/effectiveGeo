import 'package:flutter/material.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/loading.dart';
import 'package:effective_geo/pages/settings.dart';
import 'package:effective_geo/pages/navigation.dart';
import 'package:effective_geo/pages/flashcard.dart';

void main() => runApp(MaterialApp(

  //initialRoute: '/navigation',



  routes: {
    '/': (context) => Loading(),
    '/home':(context) =>Home(),
    '/settings':(context) =>Settings(),
    '/country_table':(context) =>CountryTable(),
    '/navigation': (context) =>Navigation(),
    '/flashcard': (context) =>Flashcard(),

  },

)); // Material app

