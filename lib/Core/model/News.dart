import 'package:news_app/Core/model/SourcesResponse.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Alex Heath"
/// title : "Trump asks the Supreme Court to let him rescue TikTok"
/// description : "In a filing to the Supreme Court, President-elect Donald Trump says he wants to save TikTok from a US ban through “political means once he takes office.”"
/// url : "https://www.theverge.com/2024/12/27/24330513/trump-asks-the-supreme-court-to-let-him-rescue-tiktok"
/// urlToImage : "https://cdn.vox-cdn.com/thumbor/Fj5gWwiNOdCUjHG-AWabrgDGd7A=/0x0:2040x1334/1200x628/filters:focal(1020x667:1021x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/25334825/STK466_ELECTION_2024_CVirginia_E.jpg"
/// publishedAt : "2024-12-27T22:47:24Z"
/// content : "Trump asks the Supreme Court to let him rescue TikTok\r\nTrump asks the Supreme Court to let him rescue TikTok\r\n / The President-elect wants to save TikTok from a US ban through political means once he… [+1714 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null; // Correct usage
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source!.toJson();  // Correct usage of toJson() on a nullable source
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
