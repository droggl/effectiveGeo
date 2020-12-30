import 'dart:math';
import '../database_helper.dart';

Future<List<Map>> activateNewElements(List<Map> list, int n) async{  //n entspricht der Anzahl, der zu aktiv setzenden Vokabeln
  List<Map> erg = [];
  List<int> usedElements = [];  //um duplikate zu vermeiden werden in diesem Zyklus aktivierte elemente gefiltert
  List testList = List.of(list);

  int random = 0;
  for(int i = 0; i<10; i++) {
    do{
       random = Random().nextInt(list.length)+1;
    }while(usedElements.contains(random));

    int updateId = await DatabaseHelper.instance.update({
      '_id': testList.elementAt(random)['id'],
      'active': 1,
    });
    erg.add(testList.elementAt(random));
    usedElements.add(random);
  }

  return erg;
}