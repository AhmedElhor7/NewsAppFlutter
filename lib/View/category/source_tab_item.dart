import 'package:flutter/material.dart';
import 'package:news_app/Core/model/SourcesResponse.dart';

class SourceTabItem extends StatelessWidget {
  Sources source;
  SourceTabItem(this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(source.name ?? ''),
    );
  }
}
