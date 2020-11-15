import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/country_table.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Country Table',
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        home: CountryTable());
  }
}

