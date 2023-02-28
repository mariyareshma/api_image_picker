import 'package:api_image_picker/model/image_model.dart';
import 'package:api_image_picker/service/service.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key, this.image}) : super(key: key);
  final ImagesResult? image;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ImageWidget> {
  List<ImagesResult> originalList = <ImagesResult>[];
  String? selectedImage;

  var searchImage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text('To Pick the image'),
        suggestionTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        suggestions: const ['apple', 'orange', 'graphs'],
        onSearch: (value) async {
          searchImage = value;

          setState(() {});
        },
      ),
      body: getBody(),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  if (selectedImage != null) {
                    Navigator.pop(context, selectedImage);
                  }
                },
                child: const Text('Ok')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
        )
      ],
    );
  }

  Widget getBody() {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 10.0,
              children: getImageWidgets(snapshot.data!),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: readJson());
  }

  List<Widget> getImageWidgets(List<ImagesResult> images) {
    return images.map((e) {
      if (selectedImage == e.thumbnail) {
        return Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 5)),
          child: Image.network(e.thumbnail!),
        );
      } else {
        return GestureDetector(
          child: Image.network(e.thumbnail!),
          onTap: () {
            setState(() {
              selectedImage = e.thumbnail;
            });
          },
        );
      }
    }).toList();
  }
}
