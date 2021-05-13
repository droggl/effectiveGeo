import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/data/globals.dart' as globals;
import 'package:flutter_swiper/flutter_swiper.dart';

class Country extends StatelessWidget {
  final int index;
  Country({this.index});   //index wird über Konstruktor instanziiert

  @override
  Widget build(BuildContext context) {
    //Map country = globals.filteredCountriesEnglish[widget.index];

    // queryData;
    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.grey[850],

        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
           // if(index == 0){
             // index=this.index;
            //}


            Map country = globals.filteredCountriesEnglish[index];
            String img = country["code"];
            if (img != null) {
              String a = img[0].toLowerCase();
              String b = img[1].toLowerCase();
              img = a + b;
            }

            return Scaffold(

              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColorDark,
                brightness: Brightness.dark,
                iconTheme: IconThemeData(
                    color: Theme.of(context).primaryColor
                ),
                title: Text(
                  country["name"],
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.white

                  ),
                ),
              ),


              body: Column(  //muss da new hin??
                children: [
                  Image.asset("assets/flags/" + img + ".png",
                      //"assets/welt.jpg"  "flags/"+img + ".png"
                      width: queryData.size.height / 1),

                  SizedBox(
                      height: queryData.size.height / 30
                  ),
                  Text(
                    "Capital: " + country["capital"],
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                      height: queryData.size.height / 20
                  ),
                  Text(
                    "Region: " + country["continent"],
                      style: Theme.of(context).textTheme.headline4
                  ),
                  SizedBox(
                      height: queryData.size.height / 20
                  ),

                  Text(
                    "Population: " + country["population"],
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },

          //indicatorLayout: PageIndicatorLayout.COLOR,
          //autoplay: true,
          itemCount: globals.filteredCountriesEnglish.length,
          index: this.index,
          pagination: new SwiperPagination(
            builder: new FractionPaginationBuilder(
              color: Colors.black,
              activeColor: Theme.of(context).buttonColor,
            ),

          ),
          control: new SwiperControl(),
        )
    );



    /*GestureDetector(
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
          if (widget.index < globals.filteredCountriesEnglish.length-1) {
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
    );*/
  }
}
