import 'dart:convert';
import 'dart:io';
import 'package:api_image_picker/model/image_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

var dio = Dio();
const String imageDetails = 'ImageDetails.json';

//get the full file path of Iamges path on
Future<String> getFullFilePath() async {
  //conctruct file object based on the above base path
  var appDir = (await getApplicationDocumentsDirectory()).path;
  return '$appDir/$imageDetails';
}

Future<List<ImagesResult>> readAllFile() async {
  //get the full file path of images
  var fullFilePath = await getFullFilePath();

  //construct the file object
  var imagesFileObj = File(fullFilePath);

  //check if file exits
  if (imagesFileObj.existsSync()) {
    //read file as string
    var fileContents = imagesFileObj.readAsStringSync();

    //convert String to json
    var jsonObj = jsonDecode(fileContents);

    //convert json object to ImageArticles
    var imagePathObj = ImageSearchResult.fromJson(jsonObj);
    return imagePathObj.imagesResults;
  }
  // call Api to image
  var response = await dio.get(
      'https://serpapi.com/search.json?q=&tbm=isch&ijn=1&api_key=91ec17869c30990778bad8b03998b04340d6b00bd9b014ab780ba0fc09e42367');

  if (response.statusCode == 200) {
    var jsonObj = response.data;

    var jsonString = jsonEncode(jsonObj);

    imagesFileObj.writeAsString(jsonString);

    //convert json object to Images
    var imagesObj = ImageSearchResult.fromJson(jsonObj);
    return imagesObj.imagesResults;
  }
// return empty list
  return <ImagesResult>[];
}
