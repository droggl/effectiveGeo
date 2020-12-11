import 'package:effective_geo/cards/country_card.dart';
import 'package:effective_geo/data/countries_english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryTable extends StatefulWidget {
  @override
  _CountryTableState createState() => _CountryTableState();
}

class _CountryTableState extends State<CountryTable> {

  TextEditingController _textController = TextEditingController();

  List<dynamic> countriesEnglishCopy = List.from(countriesEnglish);

  onItemChanged(String value) {
    setState(() {
      countriesEnglishCopy = countriesEnglish
          .where((string) => string["name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
            controller: _textController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search here...',
              hintStyle: TextStyle(color: Colors.grey[700]),
              prefixIcon: Icon(Icons.search, color: Colors.white,),
            ),
            onChanged: onItemChanged,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: countriesEnglishCopy.length,
          itemBuilder: (context,  index){
            return CountryCard(country:  countriesEnglishCopy[index]);
          },
        ),
      ),
    );
  }
}


