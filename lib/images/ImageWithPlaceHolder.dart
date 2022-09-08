
import 'package:flutter/material.dart';

class ImagesWithPlaceHolder extends StatelessWidget {
  const ImagesWithPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image with loading'),
        ),
        body: Stack(
          children: <Widget>[
            const Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image: 'https://img3.akspic.ru/previews/8/3/3/8/6/168338/168338-nyujork-ulice_nyu_jorka-ulica-manhetten-zdanie-500x.jpg'),
              ),
          ],
        ),
    );
  }
}
