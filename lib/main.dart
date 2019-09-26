import "package:flutter/material.dart";
//import 'package:qrscan/qrscan.dart' as scanner;

import 'AlignWidget.dart';
import 'Button.dart';
//import 'FlexPage.dart';
//import 'RowColumn.dart';
import 'ConstrainedBoxWidget.dart';
import 'ListViewRouter.dart';
import 'PaddingWidget.dart';
import 'ScaffoldRouter.dart';
import 'StackPositioned.dart';
import 'WrapFlow.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "项目001",
      home: new MyApp(title: "我的第一个fluterdemo"),
      routes: {
//        "RowColumn":(context){
//            return RowColumn() ;
//        },
//        "FlexPage":(context){
//          return new FlexPage();
//        },
        "WrapFlow":(context){
          return new WrapFlow() ;
        },
        "StackPositioned":(constext){
          return StackPositioned() ;
        },
        "AlignWidget":(context){
          return AlignWidget();
        },
        "PaddingWidget":(context){
          return PaddingWidget() ;
        },
        "ConstrainedBoxWidget":(context){
          return ConstrainedBoxWidget();
        },
        "ScaffoldRouter":(context)=>ScaffoldRouter(),
        "ListViewRouter":(context)=>ListViewRouter()
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }

}

class MyApp extends StatefulWidget {
 final  String  title ;

 MyApp({Key key,@required this.title}) : super(key: key);
  @override
  _MyApp createState() {
    // TODO: implement createState
    return new _MyApp();
  }

}

class _MyApp extends State<MyApp> {
  int _counter = 0;

  String _scanText = '' ;
  _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      floatingActionButton: new FlatButton(onPressed: (){
        _incrementCounter();
      }, child: new Icon(Icons.add)),
      body: Scrollbar(
          child:SingleChildScrollView(
            child:  Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('点击下边的数字会变'),
                  new Text("$_counter"),
                  new Text('扫描到的值是[$_scanText]'),
                  RaisedButton(
                    child: Text("打开扫描"),
                    onPressed: () async{
//                String barcode = await scanner.scan();
//                setState(() {
//                  _scanText = barcode ;
//                });
                    },
                  ),
                  Button(
                    title: "线性布局，Row,column",
                    onPressed: (){
                      //   Navigator.pushNamed(context, "RowColumn",arguments: "线性布局，Row,column");
                    },
                  ),
                  Button(
                    title: "Flex布局",
                    onPressed: (){
                      //  Navigator.pushNamed(context, "FlexPage",arguments: "Flex布局页面");
                    },
                  ),
                  Button(
                    title: "流式布局",
                    onPressed: (){
                      Navigator.pushNamed(context, "WrapFlow",arguments: "流式布局");
                    },
                  ),
                  Button(
                    title: "StackPositioned",
                    onPressed: (){
                      Navigator.pushNamed(context, "StackPositioned",arguments: "StackPositioned");
                    },
                  ),
                  Button(
                    title: "Align 相对定位",
                    onPressed: (){
                      Navigator.pushNamed(context, "AlignWidget",arguments: "Align 相对定位");
                    },
                  ),
                  Button(
                    title: "PaddingWidget",
                    onPressed: (){
                      Navigator.pushNamed(context, "PaddingWidget",arguments: "PaddingWidget") ;
                    },
                  ),
                  Button(
                    title: "ConstrainedBoxWidget",
                    onPressed: (){
                      Navigator.pushNamed(context, "ConstrainedBoxWidget",arguments: "ConstrainedBoxWidget") ;
                    },
                  ),
                  Button(
                    title: "ScaffoldRouter",
                    onPressed: (){
                      Navigator.pushNamed(context, "ScaffoldRouter",arguments: "ScaffoldRouter") ;
                    },
                  ),
                  Button(
                    title: "ListViewRouter",
                    onPressed: (){
                      Navigator.pushNamed(context, "ListViewRouter",arguments: "ListViewRouter页面") ;
                    },
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}