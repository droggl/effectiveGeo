import 'package:effective_geo/data/countries_english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/country.dart';

class CountryCard extends StatelessWidget {

  final int index;
  CountryCard({this.index});


  @override
  Widget build(BuildContext context) {
    Map country = filteredCountriesEnglish[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return Country(index: index);
          }
        )
        );
      },
      child: Card(
        color: Colors.grey[700],
        margin: EdgeInsets.fromLTRB(4, 4, 4, 4),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  country["name"],
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 17,
                    letterSpacing: 2
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
