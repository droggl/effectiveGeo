import 'package:effective_geo/data/countries_english.dart';
import 'package:effective_geo/database_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'extract_learning_list.dart';

void getData(BuildContext context) async{

  List<Map<String, dynamic>> countries = await DatabaseHelper.instance.queryAll();

  if (countries.length > 0){  // wenn nich leer
    print("database already initialized!");
    print(countries.length);
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
        'time': "0",
        'reps': '0',
        'quality': '0',
        'easeFactor': '0',
        'interval' : '0',
        'active': '0',                    //wenn aktive = 1 wird karte gelernt
        'id': i                          //datenbANK update funktion braucht index
      },);

      print(n);
    }  //for schleife ende
    countries = await DatabaseHelper.instance.queryAll();
    print(countries.length);
    print("database initialized!");

  }
 // learningList = await extractLearningList(countries);

//  for(int i = 0; i<countries.length; i++){
  //  print(countries.elementAt(i)["id"]);
  //}
  countriesEnglish = countries;
  Navigator.pushReplacementNamed(context, '/navigation');
}