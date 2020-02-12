import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  var needBackButton = true;
  var rightButtonIcons = Icons.menu;

  TitleBar(Key key,String title,this.needBackButton,this.rightButtonIcons):super(key:key);

  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
