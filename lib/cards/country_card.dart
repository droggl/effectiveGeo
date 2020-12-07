import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/country.dart';
class CountryCard extends StatelessWidget {

  //final Country country;
  final Map country;
  CountryCard({this.country});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return Country(country);
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
