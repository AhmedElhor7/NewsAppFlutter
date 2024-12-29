import 'package:flutter/material.dart';
import 'package:news_app/Core/API/api_manager.dart';
import 'package:news_app/Core/model/NewsResponse.dart';
import 'package:news_app/Core/model/SourcesResponse.dart';

class NewsList extends StatelessWidget {
  Sources sources;
  NewsList(this.sources);
  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder<NewsResponse>(future: ApiManager.getNews(sources.id ?? ""), builder: (buildContext, snapshot) {
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
        return ListView.builder(itemBuilder: (_,index) {

return Text(newsList?[index].title ?? '');
        },itemCount:newsList?.length?? 0 ,


        );
      }),
    );
  }
}
