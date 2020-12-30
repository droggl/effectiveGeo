import 'package:effective_geo/functions/extract_learning_list.dart';
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
  bool done = learnList.length == 0;
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

    //print(smResponse.repetitions);
    //print(smResponse.interval);
    //print(smResponse.easeFactor);
    int test = await DatabaseHelper.instance.update({
      '_id': tempList[0]['id'],
      'reps':  smResponse.repetitions,
      'quality':  quality,
      'easeFactor': smResponse.easeFactor,
      'interval' : currentTimeInMinutes()+2//(smResponse.interval * 14440)+currentTimeInMinutes(), //Zeit bis zur naechsten abfrage
    });

    showAnswer = false;
    tempList.removeAt(0);
    if(tempList.length==0){
      done = true;
    }
    learnList = List.of(tempList);
    setState(() {});
    // getData(context);
    // List<Map> testList = await DatabaseHelper.instance.queryAll();
    // print(testList[0]);
  }

  @override
  Widget build(BuildContext context) {
    List<Map> tempList = List.of((learnList));
    print(tempList.length);

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
                    learnList[0]["name"],
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
                      learnList[0]["capital"],
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
                      rateCard(0, tempList);
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
                      rateCard(3, tempList);
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
                        rateCard(4, tempList);
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
                      rateCard(5, tempList);
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
