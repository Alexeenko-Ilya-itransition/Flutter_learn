import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/secondScreen': (context) => const SecondScreen(),
        '/sendDataScreen': (context) => SendDataScreen(),
        '/detailsScreen': (context) => const DetailsScreen()
      },
      debugShowCheckedModeBanner: false,
    ));


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _navigateAndDisplaySelection(context);
                },
                child: const Text('Get result')),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sendDataScreen');
                },
                child: const Text('Send Data Screen')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: () {},
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      '/secondScreen',
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose variant'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yep');
                  },
                  child: const Text('Yep')),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope');
                  },
                  child: const Text('Nope'))
            ],
          )),
    );
  }
}

class SendDataScreen extends StatelessWidget {
    SendDataScreen({Key? key}) : super(key: key);

  final list = List.generate(20, (index) => Info(
    'Element $index', 'A description of what needs to be done for Todo $index'
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send data screen'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].title),
            onTap: (){
              Navigator.pushNamed(
                context,
                '/detailsScreen',
                arguments: list[index]
              );
            },
          );
        }
      )
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)?.settings.arguments as Info;
    return Scaffold(
      appBar: AppBar(
        title: Text(info.title),
      ),
      body: Center(
          child: Text(info.description)
      ),
    );
  }
}

class Info {
  final String title;
  final String description;

  const Info(this.title, this.description);
}