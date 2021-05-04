import 'package:effective_geo/functions/theme_behavior_subj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:effective_geo/data/globals.dart' as globals;

import '../main.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final themeMarker = getTheme.get<AppThemeDataMarker>();
  bool value = globals.darkMode;  //Zustand muss noch in Datenbank übernommen werden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline2
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: ' User interface',
            titleTextStyle: TextStyle(
              color: Theme.of(context).buttonColor,
              fontSize: 18
            ),
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Darkmode on',
                leading: Icon(Icons.lightbulb),
                switchValue: globals.darkMode,
                onToggle: (bool value) {
                  if(globals.darkMode){
                    globals.darkMode = false;
                    themeMarker.changeToLightTheme();
                  }else{
                    globals.darkMode = true;
                    themeMarker.changeToDarkTheme();
                  }
                  setState(() {});
                  },
              ),
            ],
          ),
          SettingsSection(
            title: 'test',
            titleTextStyle: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 18
            ),
            tiles: [
              SettingsTile.switchTile(
                title: 'ist das ein tolles settings ui?',
                leading: Icon(Icons.colorize_outlined),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],

          )
        ],
      ),
    );
  }
}

/*
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData= MediaQuery.of(context);
    double space = queryData.size.height/50;
    double spaceTwo = queryData.size.height/80;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
            "Settings",
            //style: Theme.of(context).textTheme.headline2
        ),
      ),

      body: Column(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: space,
              ),
              Container(
                  child:Text(
                    "  App Settings",
                    style: Theme.of(context).textTheme.headline5,
                  )
              ),
              SizedBox(
                height: space,
              ),
              Container(
                child: Text(
                  "  App-Appearence:",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 0,//spaceTwo,
              ),
              FlatButton(
                child: Text(
                    "Text"
                ),

              ),

            ],

          )
        ],

      ),

    );
  }
}
*/