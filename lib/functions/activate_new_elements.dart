import 'dart:math';
import '../database_helper.dart';

Future<List<Map>> activateNewElements(List<Map> list, int n) async{  //n entspricht der Anzahl, der zu aktiv setzenden Vokabeln
  List<Map> erg = [];
  List<int> usedElements = [];  //um duplikate zu vermeiden werden in diesem Zyklus aktivierte elemente gefiltert
  List testList = List.of(list);
  testList.removeLast();

  print(testList.length);

  if(list.length<10){
    n = testList.length;
  }

  int random = 0;
  for(int i = 0; i<n; i++) {
    do{
      random = Random().nextInt(testList.length);  //weil noch ein element zu viel drin ist
    }while(usedElements.contains(random));

   // print(random);

    int updateId = await DatabaseHelper.instance.update({
      '_id': testList.elementAt(random)['id'],
      'active': 1,
    });
    erg.add(testList.elementAt(random));
    usedElements.add(random);
   // print("klappt");
  }

  return erg;
}