import 'dart:math';
import '../database_helper.dart';

Future<List<Map>> activateNewElements(List<Map> list, int n) async{  //n entspricht der Anzahl, der zu aktiv setzenden Vokabeln
  List<Map> erg = [];

  for(int i = 0; i<n; i++) {
    int random = Random().nextInt(list.length);
    int updateId = await DatabaseHelper.instance.update({
      '_id': list.elementAt(random)['id'],
      'active': 1,
    });
    print(updateId);
    erg.add(list.removeAt(random));
  }

  return erg;
}