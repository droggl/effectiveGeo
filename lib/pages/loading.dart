import 'package:effective_geo/functions/get_database_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


@override
void initState() {
    super.initState();
    getData(context);

  }


  @override
  Widget build(BuildContext context) {     //Loading Screen
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
    );
  }



}


