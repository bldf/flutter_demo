import 'dart:developer';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    log(size.toString());
    Gradient gradient =
        LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]);
    Shader shader =
        gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    return Scaffold(
      appBar: AppBar(
        title: Text('TextWidget和Container的练习'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(10),
        // color: Colors.greenAccent,
        transform: Matrix4.rotationZ(.1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              //线性渐变
              colors: [Colors.yellow, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            // gradient: RadialGradient(
            //     //背景径向渐变
            //     colors: [Colors.red, Colors.orange],
            //     center: Alignment.bottomCenter,
            //     radius: .98),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 15.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0)
            ],
            border: Border.all(color: Colors.blue, width: 20),
            color: Colors.yellow,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(25), bottom: Radius.elliptical(20, 10))),
        child: Align(
          child: Text(
            '我的第一个TextWidget我的第一个TextWidget我的第一个TextWidget我的第一',
            textAlign: TextAlign.center,
            maxLines: 1, //最多显示多少行
            overflow: TextOverflow.ellipsis,

            style: TextStyle(
                // backgroundColor: Colors.blueGrey,
                foreground: Paint()..shader = shader,
                // color: Colors.white54,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.double,
                fontFamily: 'Rock Salt',
                shadows: <Shadow>[
                  Shadow(
                      offset: Offset(10, 10),
                      blurRadius: 3.0,
                      color: Colors.red),
                  Shadow(
                      color: Colors.blue,
                      blurRadius: 10,
                      offset: Offset(20, 20))
                ],
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}
