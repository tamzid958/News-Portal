import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/layouts/home/components/safety_and_news.dart';
import 'post_and_Jobs.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/Covid 03.jpg"),
              ),
            ),
            PostJobs(),
            SafetyNews()
          ],
        ),
      ),
    );
  }
}
