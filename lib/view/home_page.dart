import 'package:flutter/material.dart';

import 'image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker App')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl != null
                ? Image.network(imageUrl!)
                : Image.asset('assets/picture.png/'),
            ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ImageWidget())));

                  if (result != null) {
                    setState(() {
                      imageUrl = result;
                    });
                  }
                },
                child: const Text('Pick the image')),
          ],
        ),
      ),
    );
  }
}
