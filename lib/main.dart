import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

  class _MyAppState extends State<MyApp>{

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My first app'), centerTitle: true),
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context,i){
              if(i.isOdd) return const Divider();
              final index = i ~/ 2;
              if(index >= _suggestions.length){
                _suggestions.addAll(generateWordPairs().take(10));
              }
          return ListTile(
            title: Text(_suggestions[index].asPascalCase,
            style: _biggerFont,
            )
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Text('button'),
          onPressed: () {},
        ),
      ));
  }
}
