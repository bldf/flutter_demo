import 'package:flutter/material.dart';

class WrapFlow extends StatelessWidget {
  _getChip() {
    List<Chip> list = [];
    for (int a = 0; a < 300; a++) {
      list.add(Chip(
        label: Text("flow"),
        avatar: CircleAvatar(
          backgroundColor: Colors.red,
          child: Text("$a"),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(ModalRoute.of(context).settings.arguments),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
            child: Wrap(
                spacing: 2, //水平方向间距
                runSpacing: 8, //纵轴方向间距
                alignment: WrapAlignment.center,
                children: <Widget>[..._getChip()],
          ),

          ),

        )));
  }
}
