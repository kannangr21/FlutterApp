import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Random Words Generator',
      home: RamdomWords(),
    );
  }
}

class RamdomWords extends StatefulWidget {
  const RamdomWords({Key? key}) : super(key: key);

  @override
  _RamdomWordsState createState() => _RamdomWordsState();
}

class _RamdomWordsState extends State<RamdomWords> {
  final _suggestions = <WordPair>[];
  final _fontSize = const TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) {
          return const Divider(); /*2*/
        }

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fontSize,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
