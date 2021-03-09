import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/layouts/details/details.dart';
import 'package:newsportal/src/layouts/mynews/components/news.dart';
import 'package:newsportal/src/models/news.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var newslist;
  bool _loading = true;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(KdefaultPaddin),
      child: !_loading
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: newslist.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  singleNews: newslist[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        singleNews: newslist[index],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
