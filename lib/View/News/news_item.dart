import 'package:flutter/material.dart';
import 'package:news_app/Core/model/News.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: ClipRRect(
            child: Image.network(
              news.urlToImage ?? '',
              width: double.infinity,
              height: 200,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        Text(
          news.author ?? '',
          textAlign: TextAlign.start,
        ),
        Text(
          news.title ?? '',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          news.publishedAt ?? '',
          textAlign: TextAlign.end,
        ),
      ],
    ));
  }
}
