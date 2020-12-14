import 'package:effective_geo/data/countries_english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Country extends StatefulWidget {

  int index;
  Country({this.index});

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {

  @override
  Widget build(BuildContext context) {
    Map country = filteredCountriesEnglish[widget.index];

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    String img = country["code"];
    if (img != null) {
      String a = img[0].toLowerCase();
      String b = img[1].toLowerCase();
      img = a + b;
    }

    // int sensivity = 10;
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 1) {
          // swiping in right direction
          if (widget.index != 0) {
            widget.index -= 1;
            setState(() {});
          }
        }
        if (details.delta.dx < -1){
          // swiping in left direction
          if (widget.index < filteredCountriesEnglish.length-1) {
            widget.index += 1;
            setState(() {});
          }
        }
      },


      // onHorizontalDragUpdate: (details) {
      //   // Note: Sensitivity is integer used when you don't want to mess up vertical drag
      //   if (details.delta.dx > sensivity) {
      //     // Right Swipe
      //     if (widget.index != 0) {
      //       widget.index -= 1;
      //       setState(() {});
      //     }
      //   } else if(details.delta.dx < -sensivity){
      //     //Left Swipe
      //     // swiping in left direction
      //     if (widget.index < filteredCountriesEnglish.length-1) {
      //       widget.index += 1;
      //       setState(() {});
      //     }
      //   }
      // },

      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            country["name"],
            style: TextStyle(
                letterSpacing: 2,
                color: Colors.white

            ),
          ),
        ),
        body: Column(
          children: [
            Image.asset("assets/flags/" + img + ".png",
                //"assets/welt.jpg"  "flags/"+img + ".png"
                width: queryData.size.height / 1),

            SizedBox(
                height: queryData.size.height / 30
            ),
            Text(
              "Capital: " + country["capital"],
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
            SizedBox(
                height: queryData.size.height / 20
            ),
            Text(
              "Region: " + country["continent"],
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
            SizedBox(
                height: queryData.size.height / 20
            ),

            Text(
              "Population: " + country["population"],
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
