import "package:flutter/material.dart" ;

// 一个通用的InhertedWidget , 保存需要跨组件的状态
class InhertedWidgetRouter<T> extends InheritedWidget{
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
  

}