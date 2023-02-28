import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/image_model.dart';

Future<List<ImagesResult>> readJson() async {
  final String response = await rootBundle.loadString('assets/image.json');
  final jsonObj = await json.decode(response);

  var imageSearchResultObj = ImageSearchResult.fromJson(jsonObj);
  var imageResult = imageSearchResultObj.imagesResults;

  return imageResult;
}
