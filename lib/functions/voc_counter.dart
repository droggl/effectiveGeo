import 'package:rxdart/rxdart.dart';

class Counter{
  BehaviorSubject _counter = BehaviorSubject.seeded(0);              //für die Anzahl der gerade zu lernenden Vokabeln

  Stream get stream$ => _counter.stream;
  int get current => _counter.value;

  increment(){
    _counter.add(current+1);
  }
  decrement(){
    _counter.add(current-1);
  }
  set(int n){
    _counter.add(n);
  }
}



class KnownCounter{
BehaviorSubject _knownVocabCounter = BehaviorSubject.seeded(0);

Stream get knownVocabStream$ => _knownVocabCounter.stream;
int get currentKnownVocabs => _knownVocabCounter.value;

incrementKnownVocs(){
  _knownVocabCounter.add(currentKnownVocabs+1);
}
setZero(){
  _knownVocabCounter.add(0);
}

}