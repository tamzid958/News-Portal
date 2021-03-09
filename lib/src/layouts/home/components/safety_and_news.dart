import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/layouts/mynews/mynews.dart';

class SafetyNews extends StatelessWidget {
  const SafetyNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => null,
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(KdefaultPaddin * 1.5, KdefaultPaddin,
                  KdefaultPaddin * 1.5, KdefaultPaddin),
              child: Column(
                children: [
                  Icon(
                    Icons.security,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text("My Safety"),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyNewsScreen(),
            ),
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(KdefaultPaddin * 1.5, KdefaultPaddin,
                  KdefaultPaddin * 1.5, KdefaultPaddin),
              child: Column(
                children: [
                  Icon(
                    Icons.note_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text("My News"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
