import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid List'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Sliver app bar'),
                  floating: true,
                  flexibleSpace: Placeholder(),
                  expandedHeight: 60,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                              title: Text('Item $index'),
                            ),
                        childCount: 50))
              ],
            )));
  }
}
