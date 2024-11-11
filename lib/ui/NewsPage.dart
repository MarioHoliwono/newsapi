import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/api/ApiService.dart';
import 'NewsCard.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ApiService apiService = ApiService();
  List articles = [];

  void initState(){
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try{
      final result = await apiService.topHeadlines("us");
      print(result);
      setState(() {
        articles = result.articles;
      });
    }catch (e){
      print("Error $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News API"),
        ),
        body: articles.isEmpty ?
        const Center(child: Text('No available news')) :
        ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              final article = articles[index];
              return NewsCard(article: article);
            }
        )
    );
  }
}