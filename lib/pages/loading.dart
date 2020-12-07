import 'package:effective_geo/data/countries_english.dart';
import 'package:effective_geo/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


void getData() async{

  List<Map<String, dynamic>> countries = await DatabaseHelper.instance.queryAll();

  if (countries.length > 0){  // wenn nich leer
    print("database already initialized!");
    //List<Map<String, dynamic>> countries = await DatabaseHelper.instance.queryAll();
    print(countries.length);
  }
  else{
        var response = await Dio().get("https://restcountries.eu/rest/v2/all");  //wenn leer
        List element = response.data;
        for(int i = 0; i<element.length; i++){  //250 mal
          Map instance = element.elementAt(i);

           int n = await DatabaseHelper.instance.insert({
             'name':instance["name"],
             'code':instance["alpha2Code"],
             'capital':instance[ "capital"],
             'continent':instance[ "subregion"],
             'population':instance["population"]
          },);
        }  //for schleife ende
        List<Map<String, dynamic>> countries = await DatabaseHelper.instance.queryAll();
        print(countries.length);
        print("database initialized!");
  }
  countriesEnglish = countries;
  Navigator.pushReplacementNamed(context, '/navigation');
}

@override
void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {     //Loading Screen
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
    );
  }
}
