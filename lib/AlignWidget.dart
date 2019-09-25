import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context).settings.arguments),
      ),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.amberAccent,
        child: Align(
          heightFactor: 2,
          widthFactor: 2,
//          alignment: Alignment.bottomCenter, //原点是  中心
          alignment: FractionalOffset(0.2, 0.6),// 原点 是  0,0
          child: FlutterLogo(
            size: 30,
          ),
        ),
      ),
    );
  }
}
