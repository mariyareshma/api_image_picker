class ImagePicker {
  ImagePicker({
    required this.searchMetadata,
    required this.searchParameters,
    required this.searchInformation,
    required this.shoppingResults,
    required this.suggestedSearches,
    required this.imagesResults,
    required this.relatedSearches,
  });

  final SearchMetadata? searchMetadata;
  final SearchParameters? searchParameters;
  final SearchInformation? searchInformation;
  final List<ShoppingResult> shoppingResults;
  final List<SuggestedSearch> suggestedSearches;
  final List<ImagesResult> imagesResults;
  final List<RelatedSearch> relatedSearches;

  factory ImagePicker.fromJson(Map<String, dynamic> json) {
    return ImagePicker(
      searchMetadata: json["search_metadata"] == null
          ? null
          : SearchMetadata.fromJson(json["search_metadata"]),
      searchParameters: json["search_parameters"] == null
          ? null
          : SearchParameters.fromJson(json["search_parameters"]),
      searchInformation: json["search_information"] == null
          ? null
          : SearchInformation.fromJson(json["search_information"]),
      shoppingResults: json["shopping_results"] == null
          ? []
          : List<ShoppingResult>.from(
              json["shopping_results"]!.map((x) => ShoppingResult.fromJson(x))),
      suggestedSearches: json["suggested_searches"] == null
          ? []
          : List<SuggestedSearch>.from(json["suggested_searches"]!
              .map((x) => SuggestedSearch.fromJson(x))),
      imagesResults: json["images_results"] == null
          ? []
          : List<ImagesResult>.from(
              json["images_results"]!.map((x) => ImagesResult.fromJson(x))),
      relatedSearches: json["related_searches"] == null
          ? []
          : List<RelatedSearch>.from(
              json["related_searches"]!.map((x) => RelatedSearch.fromJson(x))),
    );
  }
}

class ImagesResult {
  ImagesResult({
    required this.position,
    required this.thumbnail,
    required this.source,
    required this.title,
    required this.link,
    required this.original,
    required this.originalWidth,
    required this.originalHeight,
    required this.isProduct,
    required this.inStock,
    required this.tag,
  });

  final int? position;
  final String? thumbnail;
  final String? source;
  final String? title;
  final String? link;
  final String? original;
  final int? originalWidth;
  final int? originalHeight;
  final bool? isProduct;
  final bool? inStock;
  final String? tag;

  factory ImagesResult.fromJson(Map<String, dynamic> json) {
    return ImagesResult(
      position: json["position"],
      thumbnail: json["thumbnail"],
      source: json["source"],
      title: json["title"],
      link: json["link"],
      original: json["original"],
      originalWidth: json["original_width"],
      originalHeight: json["original_height"],
      isProduct: json["is_product"],
      inStock: json["in_stock"],
      tag: json["tag"],
    );
  }
}

class RelatedSearch {
  RelatedSearch({
    required this.link,
    required this.serpapiLink,
    required this.query,
    required this.highlightedWords,
    required this.thumbnail,
  });

  final String? link;
  final String? serpapiLink;
  final String? query;
  final List<String> highlightedWords;
  final String? thumbnail;

  factory RelatedSearch.fromJson(Map<String, dynamic> json) {
    return RelatedSearch(
      link: json["link"],
      serpapiLink: json["serpapi_link"],
      query: json["query"],
      highlightedWords: json["highlighted_words"] == null
          ? []
          : List<String>.from(json["highlighted_words"]!.map((x) => x)),
      thumbnail: json["thumbnail"],
    );
  }
}

class SearchInformation {
  SearchInformation({
    required this.imageResultsState,
    required this.queryDisplayed,
    required this.menuItems,
  });

  final String? imageResultsState;
  final String? queryDisplayed;
  final List<MenuItem> menuItems;

  factory SearchInformation.fromJson(Map<String, dynamic> json) {
    return SearchInformation(
      imageResultsState: json["image_results_state"],
      queryDisplayed: json["query_displayed"],
      menuItems: json["menu_items"] == null
          ? []
          : List<MenuItem>.from(
              json["menu_items"]!.map((x) => MenuItem.fromJson(x))),
    );
  }
}

class MenuItem {
  MenuItem({
    required this.position,
    required this.title,
    required this.link,
    required this.serpapiLink,
  });

  final int? position;
  final String? title;
  final String? link;
  final String? serpapiLink;

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      position: json["position"],
      title: json["title"],
      link: json["link"],
      serpapiLink: json["serpapi_link"],
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

class ShoppingResult {
  ShoppingResult({
    required this.position,
    required this.title,
    required this.price,
    required this.extractedPrice,
    required this.link,
    required this.source,
    required this.shipping,
    required this.thumbnail,
  });

  final int? position;
  final String? title;
  final String? price;
  final int? extractedPrice;
  final String? link;
  final String? source;
  final String? shipping;
  final String? thumbnail;

  factory ShoppingResult.fromJson(Map<String, dynamic> json) {
    return ShoppingResult(
      position: json["position"],
      title: json["title"],
      price: json["price"],
      extractedPrice: json["extracted_price"],
      link: json["link"],
      source: json["source"],
      shipping: json["shipping"],
      thumbnail: json["thumbnail"],
    );
  }
}

class SuggestedSearch {
  SuggestedSearch({
    required this.name,
    required this.link,
    required this.chips,
    required this.serpapiLink,
    required this.thumbnail,
  });

  final String? name;
  final String? link;
  final String? chips;
  final String? serpapiLink;
  final String? thumbnail;

  factory SuggestedSearch.fromJson(Map<String, dynamic> json) {
    return SuggestedSearch(
      name: json["name"],
      link: json["link"],
      chips: json["chips"],
      serpapiLink: json["serpapi_link"],
      thumbnail: json["thumbnail"],
    );
  }
}
