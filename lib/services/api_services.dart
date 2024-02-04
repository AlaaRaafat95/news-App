import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class ApiServices {
  String apiKey = "d2fed9e173614e2f9d3aba3984b44fcc";
  String baseUrl = "https://newsapi.org";
  final dio = Dio();

  Future<List<NewsModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "$baseUrl/v2/top-headlines?country=us&apiKey=$apiKey&category=$category");
      List<Map<String, dynamic>> dedcodedResponse =
          List<Map<String, dynamic>>.from(
        response.data["articles"],
      );
      List<NewsModel> newsList =
          dedcodedResponse.map((e) => NewsModel.fromJson(e)).toList();
      return newsList;
    } catch (e) {
      return [];
    }
  }
}
