import 'package:flutter/material.dart';

import 'components/body.dart';

class MyNewsScreen extends StatelessWidget {
  const MyNewsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Headlines"),
      ),
      body: Body(),
    );
  }
}
