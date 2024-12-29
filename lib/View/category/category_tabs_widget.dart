import 'package:flutter/material.dart';
import 'package:news_app/Core/model/SourcesResponse.dart';
import 'package:news_app/View/News/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  final List<Sources> sources;

  CategoryTabsWidget(this.sources);

  @override
  _CategoryTabsWidgetState createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: widget.sources
                  .map((item) => Tab(
                        text: item.name,
                      ))
                  .toList(),
              isScrollable: true,
            ),
            NewsList(widget.sources[selectedIndex]),
            Expanded(
              child: TabBarView(
                children: widget.sources.map((item) {
                  return Center(
                    child: Text('Content for ${item.name}'),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
