import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('加载图片'),
        ),
        body: Image.asset(
          "images/a.jpg",
        ));
  }
}
