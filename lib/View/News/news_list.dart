import 'package:flutter/material.dart';
import 'package:news_app/Core/API/api_manager.dart';
import 'package:news_app/Core/model/NewsResponse.dart';
import 'package:news_app/Core/model/SourcesResponse.dart';
import 'package:news_app/View/News/news_item.dart';

class NewsList extends StatelessWidget {
  Sources sources;
  NewsList(this.sources);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sources.id ?? ""),
        builder: (buildContext, snapshot) {
          // print('${snapshot.data?.newsList}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error Loading Data ${snapshot.error.toString()}'),
            );
          }

          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server Error ${snapshot.data?.message}'),
            );
          }
          var newsList = snapshot.data?.newsList;
          return ListView.builder(
            itemBuilder: (_, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        });
  }
}
