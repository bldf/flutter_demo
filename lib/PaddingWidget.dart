import 'package:flutter/material.dart';
class PaddingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context).settings.arguments)
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8), //对左边8像素的空白
              child: Text("我是第一个子组件",
                style: TextStyle(
                  backgroundColor: Colors.amberAccent,
                  color: Colors.white

                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("我是第二个widget",
              style: TextStyle(
                backgroundColor: Colors.yellow
              ),),
            )
          ],
        ),
      ),
    );
  }

}