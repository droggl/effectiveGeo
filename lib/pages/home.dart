import 'package:effective_geo/functions/voc_counter.dart';
import 'package:flutter/material.dart';
import '../main.dart';


class Home extends StatelessWidget{

  final vocabCounter = getIt.get<Counter>();
  final knownVocabCounter = getKnownVocs.get<KnownCounter>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double spaceOne = queryData.size.height/25;
    double spaceThree = queryData.size.height/35;
    double spaceFive = queryData.size.height/50;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor
        ),
        title: Text(
          "effective geo",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 26
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: spaceFive,
              ),

              SizedBox(
                height: queryData.size.height/13,
              ),

              // Image.network("https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixlib=rb-1.2."
              //     "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60"),

              Image.asset("assets/map_colored.png",//"assets/welt.jpg",
                width: queryData.size.height/2.5,
                height: queryData.size.height/3,
              ),

              SizedBox(
                height: queryData.size.height/20,
              ),


              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(

                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(spaceThree, spaceThree, spaceThree, spaceThree),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                      ),
                      color: Theme.of(context).buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, "/flashcard");
                        //setState(() {});
                      },
                      child: Text(
                        "Start Learning",
                        style: TextStyle(
                            color: Colors.white, //Color(0xFF477902),// Theme.of(context).buttonColor,
                            fontSize: 25,
                            letterSpacing: 1.5
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(spaceFive, spaceOne, 0, 0),
                        child: StreamBuilder(                          //bei Veränderung von getIt(in main deklariert), wird auch vocabCounter
                          stream: vocabCounter.stream$,                // verändert (StateMenagement mit Behavior subject).
                          builder: (context, snapshot) {
                            return Text('${snapshot.data}',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  letterSpacing: 1.5
                              ),
                            );
                          },
                        )
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: queryData.size.height/15,
              ),

              Text(
                "Your Progress",
                style: Theme.of(context).textTheme.headline2
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: knownVocabCounter.knownVocabStream$,
                builder: (context, snapshot) {
                  double val;
                  if(!snapshot.hasData){
                    print('still waiting for data...');
                    val = 0;
                  }
                    else if(snapshot.hasData){
                      print('data received');
                      val = snapshot.data/250;// 265 entspricht der Anzahl aller vokabeln also 100%
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(spaceOne, 0, spaceOne, 0),
                    child: LinearProgressIndicator(
                        minHeight: 15,
                        value: val,
                        backgroundColor: Colors.grey[900],
                        valueColor:  new AlwaysStoppedAnimation<Color>(Theme.of(context).indicatorColor)
                    ),
                  );
                },
              ),

              StreamBuilder(
                  stream: knownVocabCounter.knownVocabStream$,
                  builder: (context, snapshot){
                    int val;
                    if(!snapshot.hasData){
                      val = 0;
                      print('still waiting for data...');
                    }
                    else if(snapshot.hasData){
                      val = (snapshot.data/250*100).round();
                    }

                    return  Text(val.toString() + '%',
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          letterSpacing: 1,
                          fontSize: 18
                      ),
                    );
                  }
              )
            ]




        ),


      ),
    );
  }
}













