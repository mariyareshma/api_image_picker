import 'package:api_image_picker/view/home_page.dart';
import 'package:flutter/material.dart';

class ImagePickerApp extends StatelessWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const HomePage(),
    );
  }
}
