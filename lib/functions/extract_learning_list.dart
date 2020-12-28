import '../database_helper.dart';
import 'activate_new_elements.dart';

Future<List<Map>> extractLearningList(List<Map>list) async{
  List<Map> completeList = List.of(list);
  List<Map> removeList = List.of(list);
  List<Map>erg = [];

  int j = 0;
  for(int i= 0; i<list.length-1; i++ ){
    int active = list.elementAt(j)['active'];
    if(active==1){   //Vokabel schon im Lernzyklus?
      int interval = list.elementAt(j)['interval'];
      if(interval<=currentTimeInMinutes()){ //Muss Vokabel schon wieder gelernt werden?
        Map val = removeList.removeAt(j);
        erg.add(val);
      }else {
        var a = removeList.removeAt(j); //alle Vokabeln die sich bereits im Lernzyklus befinden werden aus
        // temporärer Liste entfern, damit sie bei der Auswahl der neuen Vokabeln
        //keine Rolle spielen
      }
      j-=1;   //durch remove muss Liste immer angepasst werden
    }
    j+=1;
  }



  if(list.elementAt(250)["time"] < currentTimeInMinutes()) {   //wenn zeit für neue vokabeln zu lernen (24 Stunden nach letzter Nutzung der App) und
    print(list.elementAt(250)["time"]);
    int n = 10;            //puffer nicht zu voll!  (ca. 30???)
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
  print("hakko");


////////////////////////////////////////////////////////////////
  return erg;
}



int currentTimeInMinutes() {
var ms = (new DateTime.now()).millisecondsSinceEpoch;
return ((ms / 1000)/60).round();
}


// ERLÄUTERUNG FUNKTION:
//Im ersten Teil wird abgefragt, welche Karten bereits aktiv sind und gelernt werden. Im zweiten wird abgefragt,
// wie viele neue karten aktiviert und in den LerNzyklus integriert werden sollen.