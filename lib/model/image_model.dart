class ImageSearchResult {
  ImageSearchResult({
    required this.searchMetadata,
    required this.searchParameters,
    required this.searchInformation,
    required this.imagesResults,
  });

  final SearchMetadata? searchMetadata;
  final SearchParameters? searchParameters;
  final SearchInformation? searchInformation;
  final List<ImagesResult> imagesResults;

  factory ImageSearchResult.fromJson(Map<String, dynamic> json) {
    return ImageSearchResult(
      searchMetadata: json["search_metadata"] == null
          ? null
          : SearchMetadata.fromJson(json["search_metadata"]),
      searchParameters: json["search_parameters"] == null
          ? null
          : SearchParameters.fromJson(json["search_parameters"]),
      searchInformation: json["search_information"] == null
          ? null
          : SearchInformation.fromJson(json["search_information"]),
      imagesResults: json["images_results"] == null
          ? []
          : List<ImagesResult>.from(
              json["images_results"]!.map((x) => ImagesResult.fromJson(x))),
    );
  }
}

class ImagesResult {
  ImagesResult({
    required this.position,
    required this.original,
    required this.originalWidth,
    required this.originalHeight,
    required this.source,
    required this.title,
    required this.link,
    required this.thumbnail,
  });

  final int? position;
  final String? original;
  final int? originalWidth;
  final int? originalHeight;
  final String? source;
  final String? title;
  final String? link;
  final String? thumbnail;

  factory ImagesResult.fromJson(Map<String, dynamic> json) {
    return ImagesResult(
      position: json["position"],
      original: json["original"],
      originalWidth: json["original_width"],
      originalHeight: json["original_height"],
      source: json["source"],
      title: json["title"],
      link: json["link"],
      thumbnail: json["thumbnail"],
    );
  }
}

class SearchInformation {
  SearchInformation({
    required this.imageResultsState,
  });

  final String? imageResultsState;

  factory SearchInformation.fromJson(Map<String, dynamic> json) {
    return SearchInformation(
      imageResultsState: json["image_results_state"],
    );
  }
}

class SearchMetadata {
  SearchMetadata({
    required this.id,
    required this.status,
    required this.jsonEndpoint,
    required this.createdAt,
    required this.processedAt,
    required this.googleUrl,
    required this.rawHtmlFile,
    required this.totalTimeTaken,
  });

  final String? id;
  final String? status;
  final String? jsonEndpoint;
  final String? createdAt;
  final String? processedAt;
  final String? googleUrl;
  final String? rawHtmlFile;
  final double? totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) {
    return SearchMetadata(
      id: json["id"],
      status: json["status"],
      jsonEndpoint: json["json_endpoint"],
      createdAt: json["created_at"],
      processedAt: json["processed_at"],
      googleUrl: json["google_url"],
      rawHtmlFile: json["raw_html_file"],
      totalTimeTaken: json["total_time_taken"],
    );
  }
}

class SearchParameters {
  SearchParameters({
    required this.engine,
    required this.q,
    required this.googleDomain,
    required this.ijn,
    required this.device,
    required this.tbm,
  });

  final String? engine;
  final String? q;
  final String? googleDomain;
  final String? ijn;
  final String? device;
  final String? tbm;

  factory SearchParameters.fromJson(Map<String, dynamic> json) {
    return SearchParameters(
      engine: json["engine"],
      q: json["q"],
      googleDomain: json["google_domain"],
      ijn: json["ijn"],
      device: json["device"],
      tbm: json["tbm"],
    );
  }
}
