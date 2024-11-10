import 'Article.dart';

class ArticleResults {
  String status;
  int totalResults;
  List<Article> articles;

  ArticleResults({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResults.fromJson(Map<String, dynamic> json) => ArticleResults(
    status: json["status"],
    totalResults: json["totalResults"],
    articles:
    List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );
}
