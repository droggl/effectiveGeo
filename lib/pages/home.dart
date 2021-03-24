import 'package:effective_geo/functions/voc_counter.dart';
import 'package:flutter/material.dart';
//import 'package:effective_geo/data/globals.dart' as globals;
import '../main.dart';


class Home extends StatelessWidget{

  //final int prozent = (globals.progress*100).round();
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
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: spaceFive,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SizedBox(

                    ),
                    flex: 1,
                  ),

                  Expanded(
                    flex: 2,
                    child: SafeArea(
                      child: Text(
                        "Effective Geo",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 23,
                            letterSpacing: 3
                        ),
                      ),

                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(spaceOne, 0, 0, 0),
                      child: SafeArea(
                        child: IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/settings");
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: queryData.size.height/11,

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
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              color: Colors.amber
                          )
                      ),
                      color: Colors.grey[900],
                      onPressed: () {
                        Navigator.pushNamed(context, "/flashcard");
                        //setState(() {});
                      },
                      child: Text(
                        "Start Learning",
                        style: TextStyle(
                            color: Colors.amber,
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
                height: queryData.size.height/25,
              ),

              // Image.network("https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixlib=rb-1.2."
              //     "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60"),



              Image.asset("assets/welt.jpg",
                width: queryData.size.height/2.1,
                //height: queryData.size.height/1.5,
              ),


              SizedBox(
                height: queryData.size.height/40,
              ),

              Text(
                "Your Progress",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    letterSpacing: 2
                ),
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
                      val = snapshot.data/256;// 265 entspricht der Anzahl aller vokabeln also 100%
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(spaceOne, 0, spaceOne, 0),
                    child: LinearProgressIndicator(
                        minHeight: 15,
                        value: val,
                        backgroundColor: Colors.grey[900],
                        valueColor:  new AlwaysStoppedAnimation<Color>(Colors.amber)
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
                      val = (snapshot.data/256*100).round();
                    }

                    return  Text(val.toString() + '%',
                      style: TextStyle(
                          color: Colors.amber,
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













