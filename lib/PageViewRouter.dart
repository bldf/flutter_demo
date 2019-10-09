import 'package:flutter/material.dart';

class PageV extends StatefulWidget {
  @override
  _PageVState createState() => _PageVState();
}

class _PageVState extends State<PageV> with WidgetsBindingObserver {
  PageController _pageController;
  @override
  void initState() {
    // 初始化state值，在实例化的时候
    super.initState();

    // PageView的控制器, 另存变量方便控制整体view层
    _pageController = PageController(
      initialPage: 1, // 默认显示的页面（数组）
      viewportFraction: 0.5, // 每个页面应占用的视口部分
      // keepPage: true, // 用于控制进入另外页面，回退的时候还可以保持在当前滚动的位置
    );
    print('initState');
  }

  List<String> imgData = [
    'https://p.ssl.qhimg.com/dmfd/420_627_/t01a2251beb1831f2cf.png',
    'https://p.ssl.qhimg.com/dmfd/364_259_/t01e01a0dc3c563496a.png',
    'https://p.ssl.qhimg.com/dmfd/364_259_/t01e01a0dc3c563496a.png',
    'https://p.ssl.qhimg.com/dmfd/364_259_/t01e01a0dc3c563496a.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageView页面'), // 可以显示父组件的标题
      ),
      body: PageView.builder(
        controller: _pageController, // 整体pageView动画对象
        itemCount: imgData.length, // 总数量长度
        itemBuilder: (context, postion) {
          return imageSlider(postion); // 动态渲染的组件,传入索引值
        },
        onPageChanged: (int index) {}, // 点击view切换触发事件
        pageSnapping: true, // 设置为false可禁用页面捕捉，这对于自定义滚动行为很有用
      ),
    );
  }

  _onPageChanged(int index) {
    // print(index);
    // setState(() {});
  }

  Future<String> mockNetworkData() async {
    //链式调用，捕获异常
    // new Future.then(funA(),onError: (e) {  }).then(funB(),onError: (e) {  })
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  // 定义切换pageView显示的组件
  Widget imageSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        // 判断有拖动滑过组件
        if (_pageController.position.haveDimensions) {
          // 计算个widget的位置
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        // 最终显示的动画组件
        return Center(
          child: SizedBox(
            // 定义动画曲线，慢进快出动画显示 宽高
            width: Curves.easeInOut.transform(value) * 200,
            height: Curves.easeInOut.transform(value) * 200,
            child: widget, // 下方child生成的
          ),
        );
      },
      // 每个组件生成的widget
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Image.network(
          imgData[index],
          fit: BoxFit.cover,
        ),
        color: Colors.amber,
      ),
    );
  }
}