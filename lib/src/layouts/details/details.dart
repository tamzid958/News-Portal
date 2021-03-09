import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:newsportal/src/models/news.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatelessWidget {
  final News singleNews;
  const DetailsScreen({Key key, @required this.singleNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: singleNews.url,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Clipboard.setData(
              ClipboardData(
                text: singleNews.url,
              ),
            );
          },
          child: Text(singleNews.url),
        ),
      ),
    );
  }
}
