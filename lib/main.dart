import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bestapp_exam/cart.dart';
import 'package:flutter_app_bestapp_exam/saved_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedNotifier>(
      create: (_)=>SavedNotifier(),
      child: MaterialApp(
        home: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = generateWordPairs().take(30).toList();

  Widget _buildSuggestions() {
    Iterable<Widget> titles = _suggestions.map((e) => _buildRow(e));

    final divided = titles.isNotEmpty
        ? ListTile.divideTiles(context: context, tiles: titles).toList()
        : <Widget>[];

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: divided,
    );
  }

  Widget _buildRow(WordPair pair) {
    return Consumer<SavedNotifier>(
      builder: (context, savedNotifier, child){
        return ListTile(
          title: Text(pair.asPascalCase),
          trailing: Icon(
            savedNotifier.alreadyContain(pair) ? Icons.favorite : Icons.favorite_border,
            color: savedNotifier.alreadyContain(pair) ? Colors.red : null,
          ),
          onTap: () {
              savedNotifier.toggleSaved(pair);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Future<void> _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return Cart();
      },),
    );
  }
}


