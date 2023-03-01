import 'package:api_image_picker/model/image_model.dart';
import 'package:dio/dio.dart';

var dio = Dio();

Future<List<ImagesResult>> getImageSearchResult(String searchTerm) async {
  var response = await dio.get(
      'https://serpapi.com/search.json?q=$searchTerm&tbm=isch&ijn=1&api_key=91ec17869c30990778bad8b03998b04340d6b00bd9b014ab780ba0fc09e42367');

  if (response.statusCode == 200) {
    var imageJsons = response.data;
    var imageArticleObj = ImageSearchResult.fromJson(imageJsons);
    return imageArticleObj.imagesResults;
  }

  return <ImagesResult>[];
}
