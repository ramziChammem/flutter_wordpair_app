import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _randomWordPairs = <WordPair>[];
  final _myFavorite = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if (item.isOdd) {
          return Divider();
        }
        final index = item ~/ 2;
        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final addedWordPair = _myFavorite.contains(pair);
    void addToFavorite() {
      setState(() {
        if (addedWordPair) {
          _myFavorite.remove(pair);
        } else {
          _myFavorite.add(pair);
        }
      });
    }

    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 20)),
      trailing: Icon(addedWordPair ? Icons.star : Icons.star_border,
          color: addedWordPair ? Colors.yellow : Colors.yellow),
      onTap: addToFavorite,
    );
  }

  @override
  void _addSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _myFavorite.map((WordPair elem) {
        return ListTile(
            title: Text(elem.asPascalCase, style: TextStyle(fontSize: 20)));
      });
      final List<Widget> divided = ListTile.divideTiles(tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Saved WordPairs"),
        ),
        body: ListView(
          children: divided, 
        )
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WordPair Generator",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _addSaved,
          ),
        ],
      ),
      body: _buildList(),
    );
  }
}
