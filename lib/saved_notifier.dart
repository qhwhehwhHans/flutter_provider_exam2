import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class SavedNotifier extends ChangeNotifier {
 final Set<WordPair> _saved = <WordPair>{};

 void toggleSaved(WordPair newSaved) {

  final alreadySaved = _saved.contains(newSaved);
  print("here");
  if (alreadySaved) {
   _saved.remove(newSaved);
  } else {
   _saved.add(newSaved);
  }
  notifyListeners();
 }

 bool alreadyContain(WordPair wordPair){
   return _saved.contains(wordPair);
 }

 Set<WordPair> get saved => _saved;
}