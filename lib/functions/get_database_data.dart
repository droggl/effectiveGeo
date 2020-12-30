import 'package:effective_geo/data/countries_english.dart';
import 'package:effective_geo/database_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'extract_learning_list.dart';
import 'package:effective_geo/data/learning_list.dart';

void getData(BuildContext context) async{

  List<Map<String, dynamic>> countries = await DatabaseHelper.instance.queryAll();

  if (countries.length > 0){  // wenn nich leer
    countriesEnglish = List.from(countries);
    countriesEnglish.removeAt(250);

    filteredCountriesEnglish = List.from(countries);
    filteredCountriesEnglish.removeAt(250);

    print("database already initialized!");
  }
  else{
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");  //wenn leer
    List element = response.data;
    for(int i = 0; i<element.length; i++){  //250 mal
      Map instance = element.elementAt(i);

      //initiale Datenbank wird erstellt und mit den Ländern aus response befüllt
      int n = await DatabaseHelper.instance.insert({
        'name':instance['name'],
        'code':instance['alpha2Code'],
        'capital':instance['capital'],
        'continent':instance['subregion'],
        'population':instance['population'],
        'time': 0,
        'reps': 0,
        'quality': 0,
        'easeFactor': 2.5,
        'interval' : 0,
        'active': 0,                    //wenn aktive = 1 wird karte gelernt
        'id': i +1                          //datenbANK update funktion braucht index
      },);

    }  //for schleife ende

     int n = await DatabaseHelper.instance.insert({  //Element 251 dient als Referenz und gibt in 'time' an,
       'name':"",                                    //wann das letzte mal gelernt wurde.
       'code':"",                                    //zeit muss nach lernen der flahcard gesetzt werden.
       'capital':"",
       'continent':"",
       'population':"",
       'time': 0,
       'reps': 0,
       'quality': 0,
       'easeFactor': 0,
       'interval' : 0,
       'active': 0,
       'id': 251
     },);

    countries = await DatabaseHelper.instance.queryAll();
    print("database initialized!");

    countriesEnglish = List.from(countries);
    countriesEnglish.removeAt(250);

    filteredCountriesEnglish = List.from(countries);
    filteredCountriesEnglish.removeAt(250);

  }

  learnList = await extractLearningList(countries);
  vocCount = learnList.length;

  Navigator.pushReplacementNamed(context, '/navigation');
}