import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:settings_ui/settings_ui.dart';


/*class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: value,
                onToggle: (bool value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/


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
