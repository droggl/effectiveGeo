import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/functions/voc_counter.dart';
import '../main.dart';

class IndicatorsWidget extends StatelessWidget {
  final knownVocabCounter = getKnownVocs.get<KnownCounter>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final double spaceTwo = queryData.size.height / 120;
    final double spaceThree = queryData.size.height / 77;
    double screenWidth = queryData.size.width;
    return Container(
      alignment: Alignment.center,
      height: screenWidth / 4.1,
      width: screenWidth / 4.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("250",
              style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: spaceTwo,
          ),
          Text(
            "Country's/Regions",
            style:
                TextStyle(color: Theme.of(context).buttonColor, fontSize: screenWidth/39),
          ),
          SizedBox(
            height: spaceTwo,
          ),
          StreamBuilder(
              stream: knownVocabCounter.knownVocabStream$,
              builder: (context, snapshot) {
                int val;
                int valProzent;
                if (!snapshot.hasData) {
                  val = 0;
                  valProzent = 0;
                  print('still waiting for data...');
                } else if (snapshot.hasData) {
                  val = snapshot.data;

                  ///256*100).round();
                  valProzent = (val / 250 * 100).round();
                }
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Container(
                          width: spaceThree,
                          height: spaceThree,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, color: Theme.of(context).primaryColorDark)),
                      Text(
                        " " + val.toString(),
                        style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 13),
                      ),

                      //SizedBox(width: spaceOne),
                      Text(
                        " / " + valProzent.toString() + "%",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                );
              }),
          StreamBuilder(
              stream: knownVocabCounter.knownVocabStream$,
              builder: (context, snapshot) {
                int val;
                int valProzent;
                if (!snapshot.hasData) {
                  val = 0;
                  valProzent = 0;
                  print('still waiting for data...');
                } else if (snapshot.hasData) {
                  val = 250 - snapshot.data;
                  valProzent = (val / 250 * 100).round();
                }
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Container(
                          width: spaceThree,
                          height: spaceThree,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, color: Colors.grey)),
                      Text(
                        " " + val.toString(),
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),

                      //SizedBox(width: spaceOne),
                      Text(
                        " / " + valProzent.toString() + "%",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
