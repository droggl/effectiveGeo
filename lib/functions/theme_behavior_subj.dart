import 'package:rxdart/rxdart.dart';
import 'package:effective_geo/data/appThemeData.dart'as theme_globals;

class AppThemeDataMarker{
  BehaviorSubject _themeMarker = BehaviorSubject.seeded(theme_globals.darkestThemeData);
  Stream get themeMarkerStream$ => _themeMarker.stream;
  bool get currentTheme => _themeMarker.value;

  changeToDarkTheme(){
    _themeMarker.add(theme_globals.darkestThemeData);
  }

  changeToLightTheme(){
    _themeMarker.add(theme_globals.lightThemeData);
  }
}