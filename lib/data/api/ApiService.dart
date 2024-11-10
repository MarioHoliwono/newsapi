import 'dart:convert';
import '../model/ArticleResult.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "57e973531e4d43a8a90b55fb46daf309";

  Future<ArticleResults> topHeadlines(String country, String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from Newsapi');
    }
  }
}