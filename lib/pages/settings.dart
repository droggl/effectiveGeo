import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline2
        ),
      ),

      body: Column(

      ),

    );
  }
}
