import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Core/model/NewsResponse.dart';
import 'package:news_app/Core/model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '3089a20fa2c646e7a3ab678ccc6aac6c';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(url);
    // print('/////////////////////////////////////////////// ${response.body}');
    // print(response);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
