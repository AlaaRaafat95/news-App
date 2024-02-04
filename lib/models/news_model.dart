class NewsModel {
  String? urlToImage;
  String? title;
  String? description;
  String? url;
  NewsModel.fromJson(Map<String, dynamic> news) {
    urlToImage = news["urlToImage"];
    title = news["title"];
    description = news["description"];
    url = news["url"];
  }
}
