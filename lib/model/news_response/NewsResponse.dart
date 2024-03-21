import 'News.dart';

class NewsResponse {
  NewsResponse({
    this.status,
    this.message,
    this.code,
    this.totalResults,
    this.articles,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }

  String? status;
  String? message;
  String? code;
  int? totalResults;
  List<News>? articles;

  NewsResponse copyWith({
    String? status,
    int? totalResults,
    List<News>? articles,
  }) =>
      NewsResponse(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
