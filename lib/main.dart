import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const FirstScreen(),
      '/secondScreen': (context) => const SecondScreen()
    },
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (settings) {
    if (settings.name == PassArgumentsScreen.routeName) {
      final args = settings.arguments as ScreenArguments;
      return MaterialPageRoute(
        builder: (context) {
          return PassArgumentsScreen(
            title: args.title,
            message: args.message,
          );
        },
      );
      }
    return null;
  }
));


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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          '/secondScreen',
                          arguments: ScreenArguments('Second screen', 'Screen with arguments'));
                    },
                    child: const Text('Navigate to screen that extracts arguments')),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          '/passArguments',
                          arguments: ScreenArguments('Accept arguments screen', 'Screen with arguments'));
                    },
                    child: const Text('Navigate to a named that accepts arguments')),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: () {},
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            args.message,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;
  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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

class ScreenArguments{
  ScreenArguments(this.title,this.message);

  final String title;
  final String message;
}