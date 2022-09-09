import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My first app'),
          ),
          body: Center(
              child: Text('Hello world',
                style: GoogleFonts.smooch(
                  color: Colors.red,
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold
                    )
                ),
              )
          )
        )
    );
  }
}
