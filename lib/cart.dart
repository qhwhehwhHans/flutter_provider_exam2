import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bestapp_exam/saved_notifier.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final savedNotifier = context.watch<SavedNotifier>();
    final tiles = savedNotifier.saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase),
            onTap: (){
              savedNotifier.toggleSaved(pair);
            },
          );
        },
    );

    final diveded = tiles.isNotEmpty
        ? ListTile.divideTiles(context: context, tiles: tiles).toList()
        : <Widget>[];
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Suggestions"),
      ),
      body: ListView(children: diveded,),
    );
  }
}
