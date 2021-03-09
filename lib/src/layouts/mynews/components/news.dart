import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/models/news.dart';

class NewsCard extends StatefulWidget {
  final News singleNews;
  final Function press;
  const NewsCard({
    Key key,
    @required this.singleNews,
    @required this.press,
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(KdefaultPaddin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.singleNews.headline,
                maxLines: 1,
              ),
              Image(
                image: NetworkImage(widget.singleNews.img),
              ),
              Text(
                widget.singleNews.description,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
