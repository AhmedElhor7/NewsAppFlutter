import 'package:news_app/Core/model/News.dart';

/// status : "ok"
/// totalResults : 607

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.newsList,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];

    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      newsList = [];
      json['articles'].forEach((v) {
        newsList!.add(News.fromJson(v)); // Use `!` to assert that `newsList` is non-null.
      });
    }
  }

  String? status;
  String? message;
  String? code;
  num? totalResults;
  List<News>? newsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (newsList != null) {
      map['articles'] = newsList!.map((v) => v.toJson()).toList(); // Use `!` to handle nullable type.
    }
    return map;
  }
}
