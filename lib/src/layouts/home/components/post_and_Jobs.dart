import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';

class PostJobs extends StatelessWidget {
  const PostJobs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => null,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(KdefaultPaddin),
              child: Column(
                children: [
                  Icon(
                    Icons.settings_backup_restore_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text("Post Updates"),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => null,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(KdefaultPaddin),
              child: Column(
                children: [
                  Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text("Search Jobs"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
