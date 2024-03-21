import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c10_thursday/model/news_response/NewsResponse.dart';
import 'package:news_app_c10_thursday/model/source_response/SourceResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';

  static const String apiKey = '4c52aac7002045a1ba843af37d346a32';

  static Future<SourceResponse> getSources(String categoryId) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var uri = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
