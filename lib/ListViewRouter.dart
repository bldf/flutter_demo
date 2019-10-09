import 'package:flutter/material.dart';

class ListViewRouter extends StatelessWidget {
  Widget divider1 = Divider(color: Colors.red);
  Widget divider2 = Divider(color:Colors.blue) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(ModalRoute.of(context).settings.arguments),
        ),
      ),
      body:  ListView.separated(
          itemCount: 50,
          separatorBuilder: (BuildContext context , int index){
              return index % 2 == 0 ? divider1 : divider2  ;
          },
          //itemExtent: 50, //强制高度为50;
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('$index'),
            );
          }),
    );
  }
}
