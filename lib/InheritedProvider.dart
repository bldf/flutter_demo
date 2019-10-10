import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 再此简单的返回true，每次跟新都会调用子孙节点的  didChangeDepandencies ;
    return true;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    // 如果数据发生变化，( model类调用了 notifyListeners ), 重新构建 inheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // 当Provider更新的时候 ， 如果旧数据 不 ‘==’ ， 则解绑旧数据监听， 同时添加新数据监听。

    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      data: widget.data,
      child: widget.child,
    );
  }
}

Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;
  const ChangeNotifierProvider({Key key, this.data, this.child})
      : super(key: key);

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();

  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =
        context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }
}

class Item {
  double price; // 商品价格
  int count; // 商品数量
  Item({this.count, this.price});
}

class CartModel extends ChangeNotifier {
  // 保存购物车中的商品列表
  final List<Item> _items = [];

  // 禁止改变商品里边的购物信息

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice {
    return _items.fold(0, (value, item) {
      return value + item.count * item.price;
    });

  }

  void add(Item item) {                                         
    _items.add(item);     
    notifyListeners();
  }
}


class ProviderRouter extends StatefulWidget{
  @override
  _ProviderRouterState createState() {
    return _ProviderRouterState();
  }
}

class _ProviderRouterState extends State<ProviderRouter> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ChangeNotifierProvider<CartModel>(
          
        ),
    );
  }

}