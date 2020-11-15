import 'package:flutter/material.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/loading.dart';
import 'package:effective_geo/pages/settings.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',

  routes: {
    '/': (context) => Loading(),
    '/home':(context) =>Home(),
    '/settings':(context) =>Settings(),
    '/country_table':(context) =>CountryTable()

  },
)); // Material app

