import 'package:flutter/material.dart';
import 'package:effective_geo/data/countries_english.dart';

double fontSizeEvaluation = 15;
dynamic buttonColor = Colors.grey[900];
double buttonHeight = 65;

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool showAnswer = false;
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
        child: Column(
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
                    "Question",
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
                      "Answer",
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
                      showAnswer = false;
                      setState(() {});
                    },
                    child: Text(
                      "Again",
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
                      showAnswer = false;
                      setState(() {});
                    },
                    child: Text(
                      "Hard",
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
                        showAnswer = false;
                        setState(() {});
                      },
                      child: Text(
                        "Good",
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
                      showAnswer = false;
                      setState(() {});
                    },
                    child: Text(
                      "Easy",
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
