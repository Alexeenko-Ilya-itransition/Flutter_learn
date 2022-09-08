import 'package:flutter/material.dart';

class ImagesFromTheInternet extends StatelessWidget {
  const ImagesFromTheInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image from the internet'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network('https://img3.akspic.ru/previews/8/3/3/8/6/168338/168338-nyujork-ulice_nyu_jorka-ulica-manhetten-zdanie-500x.jpg')
        ));
  }
}
