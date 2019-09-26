import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatelessWidget {
  Widget redBox = DecoratedBox(decoration:
  BoxDecoration(color: Colors.red)
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(ModalRoute
              .of(context)
              .settings
              .arguments)
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 50, //最大高度为50像素
          minWidth: double.infinity, //宽度尽可能的最大
        ),
        child: Container(
          height: 500,
          child: redBox,

        ),
      ),
    );
  }

}