import "package:flutter/material.dart";

void main() => runApp(new MyApp()) ;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '应用名称',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new MyAppHomePage(
        title: "标题名称 - flutter-demo",
      ),
    );
  }
}

class MyAppHomePage extends StatefulWidget{

  final String title  ;

  MyAppHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyAppHomeState createState() {
    // TODO: implement createState
    return new _MyAppHomeState();
  }

}

class _MyAppHomeState extends State<MyAppHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Scaffold 相当于 一个页面的路由
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center, // 主轴居中
          children: <Widget>[
            new Text("我的第一个flutter..."),
            new Text(
              '我是一个动态的值 $_counter',
              // Theme.of () //获取当前ThemeData的数据
              // context 就是 就是 Element  ui树。
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          tooltip: '点击我添加1',
          onPressed: () {
            // 当点击的时候执行的回调
            _incrementCounter();
          }),
    );
  }
}
