import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/Article.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.urlToImage),
            SizedBox(height: 8.0),
            Text(
                article.title,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 8.0),
            Text(
              article.description,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Published At: ${article.publishedAt}',
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey
              ),
            ),
            Text(
              'Source: ${article.source.name}',
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey
              ),
            ),

          ],
        ),
      ),
    );
  }
}