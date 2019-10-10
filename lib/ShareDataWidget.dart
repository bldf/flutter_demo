import "package:flutter/material.dart";

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; // 需要在字树中保存的数据

  // 定义一个便捷方法，方便子树中的widget快捷获取 共享数据
  static ShareDataWidget of(BuildContext context) {
    // inheritFromWidgetOfExactType 查找特定类型的最近的一个实例
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

// 该回调方法，决定了是否当data发生变化的时候， 是否子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用inherited中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父祖先widget中的inheritedWidget改变updateShouldNotify返回true时会被调用。
    // 如果build组件中没有依赖 inherited，则不会被调用。
    print("data的值发生改变了,变化了");
  }
}

class InheritedWidgetTestRouter extends StatefulWidget {
  @override
  _InheritedWidgetTestRouterState createState() {
    return _InheritedWidgetTestRouterState();
  }
}

class _InheritedWidgetTestRouterState extends State<InheritedWidgetTestRouter> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context).settings.arguments),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _TestWidget(),
              RaisedButton(
                child: Text('点击自增'),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
