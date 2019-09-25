import "package:flutter/material.dart" ; 

class StackPositioned extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context).settings.arguments),
      ),
      body: ConstrainedBox(//对子widget添加约束
          constraints: BoxConstraints.expand(),//可以生成一个尽可能大的用以填充另一个容器的BoxConstraints
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,//未定位的widget占满Stack整个空间
          children: <Widget>[
            Container(
              height: 200,
              width: 300,
              child: Text('Hellow World'),
              color: Colors.yellow,
            ),
            Positioned(
              left: 18.0,
              top: 100,
              child: Text('我是第一个Positioned的widget组件'),
            ),
            Positioned(
              top: 28,
              child: Text('我是第2个Positioned的widget组件'),
            )
          ],
        ),

      ),
    );
  }
  
}