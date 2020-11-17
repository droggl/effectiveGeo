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
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SafeArea(
                  child: Container(

                    margin: EdgeInsets.fromLTRB(0, 30, 50, 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    //padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: SafeArea(
                    child: IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0,0, 0),
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
              ],
            ),

            SizedBox(
              height: 50,
            ),

            Row(
              children: [
                FlatButton(
                  padding: EdgeInsets.fromLTRB(65, 0, 0, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        border: Border.all(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20),
                        )
                    ),
                    child: (
                        Text("Start learning.",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 23,
                            letterSpacing: 3,

                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    "14",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(
              height: 20,
            ),

            Image.network("https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixlib=rb-1.2."
                "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60"),
            SizedBox(
              height: 40,
            ),

            Text(
              "Your Progress",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  letterSpacing: 2
              ),
            ),
            SizedBox(
              height: 10,
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                  fontSize: 20
              ),
            )
          ]




      ),



    );
  }
}






