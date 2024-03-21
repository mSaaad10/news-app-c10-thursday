import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/model/news_response/News.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Image.network(news.urlToImage ?? '')),
          SizedBox(
            height: 8,
          ),
          Text(
            news.title!,
            style: TextStyle(fontSize: 10, color: Color(0xFF79828B)),
          ),
          Text(news.description ?? '',
              style: TextStyle(fontSize: 14, color: Color(0xFF42505C))),
          Text(
            news.publishedAt ?? '',
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
