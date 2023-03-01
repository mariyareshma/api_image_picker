import 'package:api_image_picker/model/image_model.dart';
import 'package:flutter/material.dart';
import '../service/service.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key, this.image}) : super(key: key);
  final ImagesResult? image;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ImageWidget> {
  List<ImagesResult> originalList = <ImagesResult>[];
  var isLoading = false;
  String? selectedImage;

  TextEditingController imageController = TextEditingController();

  var searchImage = '';

  @override
  void initState() {
    if (widget.image != null) {
      imageController.text = widget.image!.thumbnail!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    // Api call
                    var result =
                        await getImageSearchResult(imageController.text);
                    setState(() {
                      originalList.clear();
                      originalList.addAll(result);
                    });
                  } catch (err) {
                    debugPrint(err.toString());
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_forward))
          ],
          title: TextField(
            keyboardType: TextInputType.text,
            controller: imageController,
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search'),
          )),
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
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 10.0,
      children: getImageWidgets(originalList),
    );
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
