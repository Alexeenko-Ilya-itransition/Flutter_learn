import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: FirstScreen()));
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen'), centerTitle: true),
      body: Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, i) {
                if (i.isOdd) return const Divider();
                final index = i ~/ 2;
                if (index >= _suggestions.length) {
                  _suggestions.addAll(generateWordPairs().take(10));
                }
                return ListTile(
                    title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont,
                ));
              }),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
                child: const Text('Move to second screen')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(''),
        onPressed: () {},
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Text(
            'Second Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
        ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Move to first screen'))
        ],
      )),
    );
  }
}
