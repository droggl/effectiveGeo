import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    bool showAnswer = false;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: queryData.size.height / 3,
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
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

          FlatButton(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            onPressed: () {
              showAnswer = true;
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  // border: Border.all(
                  //   color: Colors.amber,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(5),)
              ),
              child: (
                  Text("Show answer",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 23,
                      letterSpacing: 3,

                    ),
                  )
              ),
            ),
          ),


        ],
      ),
    ),
    );
  }
}
