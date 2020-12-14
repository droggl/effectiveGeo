import 'package:flutter/material.dart';
import 'package:effective_geo/data/countries_english.dart';
import 'package:effective_geo/data/learning_list.dart';
import 'package:effective_geo/database_helper.dart';
import 'package:effective_geo/functions/sm_algorithm/sm.dart';


double fontSizeEvaluation = 15;
dynamic buttonColor = Colors.grey[900];
double buttonHeight = 65;

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool showAnswer = false;
  bool done = learningList.length == 0;
  final sm = Sm();

  void rateCard(int quality) async {

    print("before update:");
    print(countriesEnglish[0]);

    int reps =learningList[0]['reps'];
    int previousInterval = learningList[0]['interval'];
    double easeFactor = learningList[0]['easeFactor'];

    SmResponse smResponse = sm.calc(
        quality: quality,
        repetitions: reps,
        previousInterval: previousInterval,
        previousEaseFactor: easeFactor,
    );

    print(smResponse.repetitions);
    print(smResponse.interval);
    print(smResponse.easeFactor);
    await DatabaseHelper.instance.update({
      '_id': learningList[0]['id'],
      'reps': smResponse.repetitions,
      'quality': quality,
      'easeFactor': smResponse.easeFactor,
      'interval' : smResponse.interval,
      'active': 1,
    });


    showAnswer = false;
    learningList.removeAt(0);
    if(learningList.length==0){
      done = true;
    }

    setState(() {});
    print("after update:");
    print(countriesEnglish[0]);
    // getData(context);
    // List<Map> testList = await DatabaseHelper.instance.queryAll();
    // print(testList[0]);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: done? Text(
          "Done for today",
          style: TextStyle(
            color: Colors.amber
          ),
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),

            SizedBox(
              width: double.infinity,
              height: queryData.size.height / 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text(
                    learningList[0]["name"],
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 23,
                        letterSpacing: 3),
                  ),
                ),
              ),
            ),

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
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      learningList[0]["capital"],
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 23,
                          letterSpacing: 3),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: !showAnswer ?
                FlatButton(
                  shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Colors.black,

                    ),
                  ),
                  onPressed: () {
                    showAnswer = true;
                    setState(() {});
                  },

                  color: buttonColor,
                  child: Text(
                      "Show answer",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 23,
                        letterSpacing: 3,
                      )
                  ),
                )
                  :
              Row(
                children: <Widget> [
                  FlatButton(
                    height: buttonHeight,
                    minWidth: queryData.size.width / 4,
                    color: buttonColor,
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,

                      ),
                    ),
                    onPressed: () {
                      rateCard(0);
                    },
                    child: Text(
                      "<10min\nAgain",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: fontSizeEvaluation,
                      ),
                    ),
                  ),

                  FlatButton(
                    height: buttonHeight,
                    minWidth: queryData.size.width / 4,
                    color: buttonColor,
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,

                      ),
                    ),
                    onPressed: () {
                      rateCard(3);
                    },
                    child: Text(
                      "Hard",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: fontSizeEvaluation,
                      ),
                    ),
                  ),

                  FlatButton(
                      height: buttonHeight,
                      minWidth: queryData.size.width / 4,
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.black,

                        ),
                      ),
                      onPressed: () {
                        rateCard(4);
                      },
                      child: Text(
                        "Good",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: fontSizeEvaluation,
                        ),
                      )
                  ),

                  FlatButton(
                    height: buttonHeight,
                    minWidth: queryData.size.width / 4,
                    color: buttonColor,
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,

                      ),
                    ),
                    onPressed: () {
                      rateCard(5);
                    },
                    child: Text(
                      "Easy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: fontSizeEvaluation,
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
