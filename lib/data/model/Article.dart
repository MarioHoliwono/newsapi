import 'Source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    url: json["url"] ?? "",
    urlToImage: json["urlToImage"] ??
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/1280px-Gull_portrait_ca_usa.jpg",
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? "",
  );
}