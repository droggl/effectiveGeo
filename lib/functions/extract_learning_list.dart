import '../database_helper.dart';
import 'activate_new_elements.dart';

Future<List<Map>> extractLearningList(List<Map>list) async{
  List<Map> completeList = List.from(list);
  List<Map> removeList = List.from(list);
  List<Map>erg = [];

  int idx = 0;
  for(int i= 0; i<list.length-1; i++ ){
    if(removeList.elementAt(idx)['active']==1){   //Vokabel schon im Lernzyklus?
      int interval = removeList.elementAt(idx)['interval'];
      print("Nächstes Lernen: $interval");
      int current = currentTimeInMinutes();
      print("Aktuelle Zeit: $current");
      print(interval- current);
      if(interval<currentTimeInMinutes()){ //Muss Vokabel schon wieder gelernt werden?
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

  print(completeList.elementAt(completeList.length-1));
  print(currentTimeInMinutes());
  if(completeList.elementAt(completeList.length-1)["time"] < currentTimeInMinutes()) {   //wenn zeit für neue vokabeln zu lernen (24 Stunden nach letzter Nutzung der App) und
    int n = 10;
    List getNewElements = await activateNewElements(removeList, n);
    for (int i = 0; i < getNewElements.length; i++) {  //wenn liste zu klein muss n kleiner gewählt werden
      erg.add(getNewElements.elementAt(i));
    }

    int updateId = await DatabaseHelper.instance.update({
      '_id':  completeList.length,
      'time': currentTimeInMinutes()+ 1440,
    });
  }




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