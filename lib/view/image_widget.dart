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
  List<ImagesResult> filteredList = <ImagesResult>[];
  List<ImagesResult> originalList = <ImagesResult>[];

  var searchImage = '';

  Future getDataFromPath() async {
    originalList = await readJson();
  }

  Future<List<ImagesResult>> filterResults() async {
    await getDataFromPath();

    filteredList = originalList
        .where((element) => element.thumbnail!.contains(searchImage))
        .toList();

    return filteredList;
  }

  @override
  void initState() {
    filteredList.clear();
    filteredList.addAll(originalList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text('To Pick the image'),
        suggestionTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        suggestions: ['apple', 'orange', 'graphs'],
        onSearch: (value) async {
          searchImage = value;

          filterResults();
          setState(() {});
        },
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      childAspectRatio: 1.0,
      children: getImageWidgets(filteredList),
    );
  }

  List<Widget> getImageWidgets(List<ImagesResult> images) {
    return images
        .map(
          (e) => Expanded(
            child: GestureDetector(
              child: Image.network(e.thumbnail!),
            ),
          ),
        )
        .toList();
  }
}
