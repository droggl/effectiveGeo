import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/country.dart';
import 'package:effective_geo/data/globals.dart'as globals;

class CountryCard extends StatelessWidget {

  final int index;
  CountryCard({this.index});


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double spaceOne = queryData.size.height/5;
    Map country = globals.filteredCountriesEnglish[index];
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
        color: Theme.of(context).primaryColor,
        //shadowColor: Colors.black,
        margin: EdgeInsets.fromLTRB(4, 4, 4, 4),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                  children: [
                    Expanded(
                      flex: 19,
                      child: Center(
                       // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          country["name"],
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 17,
                              letterSpacing: 2
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey[800],
                      ),
                    ),
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
