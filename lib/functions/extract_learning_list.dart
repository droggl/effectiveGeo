import 'activate_new_elements.dart';

Future<List<Map>> extractLearningList(List<Map>list) async{
  List<Map> completeList = list;
  List<Map>erg = [];

  for(int i= 0; i<list.length; i++ ){
    int active = int.parse(list.elementAt(i)['active']);
    if(active==1){   //Vokabel schon im Lernzyklus?
      int interval = list.elementAt(i)['interval'];
      if(interval<=currentTimeInMinutes()){ //Muss Vokabel schon wieder gelernt werden?
        Map val = completeList.removeAt(i);
        erg.add(val);
      }else{
        var a = completeList.removeAt(i);  //alle Vokabeln die sich bereits im Lernzyklus befinden werden aus
        // temporärer Liste entfern, damit sie bei der Auswahl der neuen Vokabeln
      }                                    //keine Rolle spielen
    }
  }



  if(false  && false) {   //wenn zeit für neue vokabeln zu lernen (24 Stunden nach letzter Nutzung der App) und
    int n = 0;            //puffer nicht zu voll!  (ca. 30???)
    List getNewElements = await activateNewElements(completeList, n);
    for (int i = 0; i < n; i++) {
      erg.add(getNewElements.elementAt(i));
    }
  }
  return erg;
}



int currentTimeInMinutes() {
var ms = (new DateTime.now()).millisecondsSinceEpoch;
return ((ms / 1000)/60).round();
}


// ERLÄUTERUNG FUNKTION:
//Im ersten Teil wird abgefragt, welche Karten bereits aktiv sind und gelernt werden. Im zweiten wird abgefragt,
// wie viele neue karten aktiviert und in den LerNzyklus integriert werden sollen.