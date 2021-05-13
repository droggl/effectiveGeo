import 'package:effective_geo/functions/extract_learning_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/database_helper.dart';
import 'package:effective_geo/functions/sm_algorithm/sm.dart';
import 'package:effective_geo/functions/voc_counter.dart';
import 'package:effective_geo/data/globals.dart' as globals;
import '../main.dart';

double fontSizeEvaluation = 15;
dynamic buttonColor = Colors.grey[900];
double buttonHeight = 65;
const double buttonPadding = 3;

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  final vocabCounter = getIt.get<Counter>();              // Counter-singleton1
  final knownVocabCounter = getKnownVocs.get<KnownCounter>();   // Counter-singleton2
  bool showAnswer = false;
  bool done = globals.learnList.length == 0;
  final Sm sm = Sm();



  void rateCard(int quality, List<Map> tempList) async {


    print("before update:");

    int reps =tempList[0]['reps'];
    int previousInterval = tempList[0]['interval'];
    double easeFactor = tempList[0]['easeFactor'];

    SmResponse smResponse = sm.calc(
      quality: quality,
      repetitions: reps,
      previousInterval: previousInterval,
      previousEaseFactor: easeFactor,
    );

    print(smResponse);

    //print(smResponse.repetitions);
    //print(smResponse.interval);
    //print(smResponse.easeFactor);
    int test = await DatabaseHelper.instance.update({
      '_id': tempList[0]['id'],
      'reps':  smResponse.repetitions,
      'quality':  quality,
      'easeFactor': smResponse.easeFactor,
      'interval' : ((smResponse.interval * 14440)/2).round()+currentTimeInMinutes(), //Zeit bis zur naechsten abfrage //die durch 2 ist von mir
    });


    print("Interval: $smResponse.interval");
    print(smResponse.interval);

    showAnswer = false;
    tempList.removeAt(0);
    if(tempList.length==0){
      done = true;
    }
    globals.learnList = List.of(tempList);
    vocabCounter.set(globals.learnList.length);
    knownVocabCounter.incrementKnownVocs();

    //globals.knownVocabs+=1;

    setState(() {});
    // getData(context);
    // List<Map> testList = await DatabaseHelper.instance.queryAll();
    // print(testList[0]);
  }

  @override
  Widget build(BuildContext context) {
    List<Map> tempList = List.of((globals.learnList));
    print(tempList.length);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor
        ),
        title: Text(
          "daily cards",
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),

      body: Center(
        child: done? Text(
          "Done for today",
          style: TextStyle(
              color: Theme.of( context).buttonColor
          ),
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),

            // FRAGE
            SizedBox(
              width: double.infinity,
              height: queryData.size.height / 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],// Theme.of(context).cardColor,  //
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text(
                    globals.learnList[0]["name"],
                    style: Theme.of(context).textTheme.headline1
                  ),
                ),
              ),
            ),

            // LÖSUNG
            Visibility(
              visible: showAnswer,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child:
              SizedBox(
                width: double.infinity,
                height: queryData.size.height / 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey[100], //Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      globals.learnList[0]["capital"],
                      style: Theme.of(context).textTheme.headline1, // 3

                    ),
                  ),
                ),
              ),
            ),

            // BUTTONS
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: !showAnswer ?

              Padding(
                padding: const EdgeInsets.all(buttonPadding),
                child: ElevatedButton(
                  onPressed: () {
                    showAnswer = true;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).buttonColor,
                    onPrimary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  child: Text(
                      "Show answer",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,  //23
                        letterSpacing: 3,
                      )
                  ),
                ),
              )
                  :
              Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(buttonPadding),
                    child: ElevatedButton(
                      onPressed: () {
                        rateCard(0, tempList);
                      },
                      child: Text(
                        "<10min\nAgain",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, // Colors.red,
                          fontSize: fontSizeEvaluation,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Theme.of(context).primaryColor,
                        minimumSize: Size(queryData.size.width / 4 - buttonPadding*2, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(buttonPadding),
                    child: ElevatedButton(
                      onPressed: () {
                        rateCard(3, tempList);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Theme.of(context).primaryColor,
                        minimumSize: Size(queryData.size.width / 4 - buttonPadding*2, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Hard",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fontSizeEvaluation,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(buttonPadding),
                    child: ElevatedButton(
                        onPressed: () {
                          rateCard(4, tempList);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Theme.of(context).primaryColor,
                          minimumSize: Size(queryData.size.width / 4 - buttonPadding*2, buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Good",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: fontSizeEvaluation,
                          ),
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(buttonPadding),
                    child: ElevatedButton(
                      onPressed: () {
                        rateCard(5, tempList);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Theme.of(context).primaryColor,
                        minimumSize: Size(queryData.size.width / 4 - buttonPadding*2, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Easy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fontSizeEvaluation,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
