import 'package:rxdart/rxdart.dart';
import 'package:effective_geo/data/appThemeData.dart'as theme_globals;
import 'package:effective_geo/data/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeDataMarker {
  BehaviorSubject _themeMarker = BehaviorSubject.seeded(theme_globals.lightThemeData);  //shared prefs müssen beigefügt werden !
  Stream get themeMarkerStream$ => _themeMarker.stream;
  bool get currentTheme => _themeMarker.value;
  static SharedPreferences _prefs;

  static Future init() async => _prefs = await SharedPreferences.getInstance();
  static Future safeThemeState(bool val) async => await _prefs.setBool('theme', val);


  AppThemeDataMarker() {
    _getSafedState();
  }
  changeToDarkTheme(){
    _themeMarker.add(theme_globals.cleanThemeData);
  }

  changeToLightTheme(){
    _themeMarker.add(theme_globals.cleanThemeData);
  }

   Future<void> _getSafedState() async{
    bool darkTheme = (_prefs.getBool('theme') ?? true); //darktheme default
    await _prefs.setBool('theme', darkTheme);

    globals.darkMode = darkTheme;
    if(darkTheme){
      this.changeToDarkTheme();
    }
    else{
      this.changeToLightTheme();
    }
  }



}