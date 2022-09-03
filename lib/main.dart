import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final suggestions = <WordPair>[];
  final saved = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title: const Text('My first app'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: _pushSaved,
                  tooltip: 'Saved Suggestions',
                )
              ],
              centerTitle: true),
          body: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, i) {
                if (i.isOdd) return const Divider();
                final index = i ~/ 2;
                if (index >= suggestions.length) {
                  suggestions.addAll(generateWordPairs().take(10));
                }
                final alreadySaved = saved.contains(suggestions[index]);
                return ListTile(
                  title: Text(
                    suggestions[index].asPascalCase,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                    semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
                  ),
                  onTap: () {
                    setState(() {
                      if (alreadySaved) {
                        saved.remove(suggestions[index]);
                      } else {
                        saved.add(suggestions[index]);
                      }
                    });
                  },
                );
              }),
          floatingActionButton: FloatingActionButton(
            child: const Text('button'),
            onPressed: () {},
          ),
        );
  }

  void _pushSaved() {
    Navigator.push(
      context,
        MaterialPageRoute<void>(
          builder: (context) {
            final tiles = saved.map((pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: const TextStyle(fontSize: 16.0),
              ),
            );
          },
        );
        final divided = tiles.isNotEmpty ? ListTile.divideTiles(
            tiles: tiles,
            context: context
        ).toList() : <Widget>[];
        return Scaffold(
            appBar: AppBar(
              title: const Text('Saved suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
