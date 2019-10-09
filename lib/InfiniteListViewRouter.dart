import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class InfiniteListViewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(ModalRoute.of(context).settings.arguments),
        )
      ),
      body: PageRouter(),
    );
  }

}
class PageRouter extends StatefulWidget {
  @override
  _InfiniteListViewRouterState createState() {
    // TODO: implement createState
    return _InfiniteListViewRouterState() ;
  }
}

class _InfiniteListViewRouterState extends State<PageRouter> {
  static final String loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    //初始化创建state的时候调用
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) {
            return e.asPascalCase;
          }).toList());
          setState(() {
            return _words ;
            //重新构建列表
          });
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: 2
          );
        },
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            // 如果到了表未
            if (_words.length - 1 < 100) {
              //如果不足100条继续获取数据
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              //已经加载 了 100条数据了， 不能再加载数据了
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text('没有更多了', style: TextStyle(color: Colors.grey)),
              );
            }
          }
          print('-------------此程序执行了。。。。。-------------------------------') ;
          print(_words[index]) ;
          return ListTile(
            title: Text(_words[index]),
          );
        },
        itemCount: _words.length //列表的长度
        );
  }
}
