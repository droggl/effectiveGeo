import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double prozenti = 20; 
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double space_one = queryData.size.height/25;
    double space_three = queryData.size.height/35;
    double space_five = queryData.size.height/50;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: space_five,
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
                    padding: EdgeInsets.fromLTRB(space_one, 0, 0, 0),
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
                    padding: EdgeInsets.fromLTRB(space_three, space_three, space_three, space_three),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.amber
                      )
                    ),
                    color: Colors.grey[900],
                    onPressed: () {
                      Navigator.pushNamed(context, "/flashcard");
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
                    margin: EdgeInsets.fromLTRB(space_five, space_one, 0, 0),
                    child: Text(
                      "14",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey
                      ),
                    ),
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


            Padding(
              padding: EdgeInsets.fromLTRB(space_one, 0, space_one, 0),
              child: LinearProgressIndicator(
                  minHeight: 15,
                  value: prozenti/100,
                  backgroundColor: Colors.grey[900],
                  valueColor:  new AlwaysStoppedAnimation<Color>(Colors.amber)


              ),

            ),
            Text("$prozenti %",
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 1,
                  fontSize: 18
              ),
            )
          ]




      ),


      ),
    );
  }
}






