import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


void getData() async{

  //Response response = await.get("https...");   // Bsp. für JSON auslesen
  //Map data = jsonDecode(response.body);
}

@override
void initState() {

    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {     //Loading Screen
    return Container();
  }
}
