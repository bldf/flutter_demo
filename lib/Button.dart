import 'package:flutter/material.dart';
class Button extends StatelessWidget{
  final String title ;
  final VoidCallback  onPressed;
  const Button({Key key,@required this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return FlatButton(
      child: Text(title),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      splashColor: Colors.grey,
      colorBrightness: Brightness.dark,
      highlightColor: Colors.blue[700],
      color: Colors.blue,
      onPressed: (){
        onPressed();
      },
    );
  }



}