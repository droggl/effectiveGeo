import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);
  

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    String img = country["code"];
    if(img!=null) {
      String a = img[0].toLowerCase();
      String b = img[1].toLowerCase();
      img = a+b;
    }
    return Scaffold(
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
          Image.asset("flags/"+img + ".png",                       //"assets/welt.jpg"  "flags/"+img + ".png"
            width: queryData.size.height/1),

          SizedBox(
              height: queryData.size.height/30
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
              height: queryData.size.height/20
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
              height: queryData.size.height/20
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

    );
  }
}
