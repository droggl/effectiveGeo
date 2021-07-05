import 'package:effective_geo/widgets/indicator_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/functions/voc_counter.dart';
import '../main.dart';
import 'countrys_statistics_table.dart';
import 'package:effective_geo/data/globals.dart' as globals;

class Statistics extends StatelessWidget {
  Statistics({Key key}) : super(key: key);
  final knownVocabCounter = getKnownVocs.get<KnownCounter>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double spaceOne = queryData.size.height / 15;
    double spaceTwo = queryData.size.height / 40;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorDark,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            "effective geo",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 26),
          ),
        ),
        body: StreamBuilder(
            stream: knownVocabCounter.knownVocabStream$,
            builder: (context, snapshot) {
              int val;
              if (!snapshot.hasData) {
                val = 0;
                print('still waiting for data...');
              } else if (snapshot.hasData) {
                val = snapshot.data;
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth / 10,
                    ),
                    Row(children: [
                      Container(
                        width: screenWidth / 2,
                        alignment: Alignment(0, 0), //Butto jeweils mittig

                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(
                              spaceOne, spaceTwo, spaceOne, spaceTwo),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Theme.of(context).buttonColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatsTable(countries: globals.learnedList,)));
                          },
                          child: Text(
                            "learned",
                            style: TextStyle(
                                color: Colors.white,
                                //Color(0xFF477902),// Theme.of(context).buttonColor,
                                fontSize: 20,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth / 2,
                        alignment: Alignment(0, 0),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(
                              spaceOne, spaceTwo, spaceOne, spaceTwo),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Theme.of(context).buttonColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatsTable(countries: globals.learnList,)));
                          },
                          child: Text(
                            "to learn",
                            style: TextStyle(
                                color: Colors.white,
                                //Color(0xFF477902),// Theme.of(context).buttonColor,
                                fontSize: 20,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: screenWidth / 6,
                    ),
                    Container(
                      width: screenWidth,
                      height: screenWidth / 2,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Center(
                            child: IndicatorsWidget(),
                          ),
                          PieChart(PieChartData(
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 0,
                              centerSpaceRadius: screenWidth/4.6,
                              sections: [
                                PieChartSectionData(
                                    color: Colors.grey,
                                    value: 100 - (val / 250 * 100),
                                    title: ""),
                                PieChartSectionData(
                                    color: Theme.of(context).primaryColorDark,
                                    value: (val / 250) * 100,
                                    title: "")
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
