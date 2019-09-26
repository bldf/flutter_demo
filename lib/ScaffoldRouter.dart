import "package:flutter/material.dart";

class ScaffoldRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("ScaffoldRouter"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          items:
      <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            title: Text('首页')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.work),
            title: Text('操作')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.scanner),
            title: Text('扫一扫')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.email),
            title: Text("消息")
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.perm_identity),
            title: Text('我的')
        )
      ]
      ),

    );
  }

}