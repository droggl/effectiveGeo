import 'package:flutter/material.dart';

import '../database_helper.dart';
import 'activate_new_elements.dart';

Future<List<Map>> extractLearningList(List<Map>list) async{
  List<Map> completeList = List.from(list);
  List<Map> removeList = List.from(list);
  List<Map>erg = [];

  int idx = 0;
  for(int i= 0; i<list.length-1; i++ ){
    print("interval");
    print( removeList.elementAt(idx)['interval']);
    print(currentTimeInMinutes());
    if(removeList.elementAt(idx)['active']==1){   //Vokabel schon im Lernzyklus?
       int interval = removeList.elementAt(idx)['interval'];
      if(interval<currentTimeInMinutes()){ //Muss Vokabel schon wieder gelernt werden?
        print("HHHAAAAAAAALLLLLLOOO");
        Map val = removeList.removeAt(idx);

        erg.add(val);
      }else {
        var a = removeList.removeAt(idx); //alle Vokabeln die sich bereits im Lernzyklus befinden werden aus
        // temporärer Liste entfern, damit sie bei der Auswahl der neuen Vokabeln
        //keine Rolle spielen
      }
      idx-=1;   //durch remove muss Liste immer angepasst werden
    }
    idx+=1;
  }




  if(list.elementAt(250)["time"] < currentTimeInMinutes()) {   //wenn zeit für neue vokabeln zu lernen (24 Stunden nach letzter Nutzung der App) und
    int n = 10;
    print("hallo");
    List getNewElements = await activateNewElements(removeList, n);
    for (int i = 0; i < n; i++) {
      erg.add(getNewElements.elementAt(i));
    }
  }


  //////////////////////////////////////////////////////////////////
  int updateId = await DatabaseHelper.instance.update({
    '_id':  251,
    'time': currentTimeInMinutes()+1440,
  });


////////////////////////////////////////////////////////////////
 // print(erg.length);
  return erg;
}



int currentTimeInMinutes() {
int ms = (new DateTime.now()).millisecondsSinceEpoch;
double a = (ms/1000)/60;
return a.round();
}


// ERLÄUTERUNG FUNKTION:
//Im ersten Teil wird abgefragt, welche Karten bereits aktiv sind und gelernt werden. Im zweiten wird abgefragt,
// wie viele neue karten aktiviert und in den LerNzyklus integriert werden sollen.