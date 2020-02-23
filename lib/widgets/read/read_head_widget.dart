import 'package:flutter/material.dart';

class ReadHeadWidget extends StatelessWidget {
  final String chapterName;

  ReadHeadWidget({this.chapterName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.centerLeft,
      child: Text(chapterName,textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color: Colors.grey))
    );
  }
}
