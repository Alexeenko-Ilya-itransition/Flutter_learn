
import 'package:flutter/material.dart';
import 'lists/GridList.dart';
import 'lists/HorizontalList.dart';
import 'lists/ListWithDifferentItems.dart';
import 'lists/FloatingAppBar.dart';
import 'images/ImagesFromTheInternet.dart';
import 'images/ImageWithPlaceHolder.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/gridList': (context) => const GridList(),
        '/horizontalList': (context) => const HorizontalList(),
        '/listWithDifferentItems': (context) => ListWithDifferentItem(),
        '/floatingAppBar': (context) => const FloatingAppBar(),
        '/imageFromTheInternet': (context) => const ImagesFromTheInternet(),
        '/imageWithPlaceHolder': (context) => const ImagesWithPlaceHolder(),
      }
    )
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My first app'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gridList');
                },
                child: const Text('Grid List')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/horizontalList');
                },
                child: const Text('Horizontal List')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listWithDifferentItems');
                },
                child: const Text('List with different types of items')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/floatingAppBar');
                },
                child: const Text('Floating App Bar')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/imageFromTheInternet');
                },
                child: const Text('Image from the internet')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/imageWithPlaceHolder');
                },
                child: const Text('Image with loading')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('button'),
        onPressed: () {},
      ),
    );
  }
}