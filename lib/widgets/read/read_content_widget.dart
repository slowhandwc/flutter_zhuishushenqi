import 'package:flutter/material.dart';

class ReadContentWidget extends StatefulWidget {
  final String content;
  final TextStyle textStyle;

  const ReadContentWidget({Key key, this.content,this.textStyle}) : super(key: key);
  @override
  _ReadContentWidgetState createState() => _ReadContentWidgetState(content,textStyle);
}

class _ReadContentWidgetState extends State<ReadContentWidget> {
  final String content;

  final TextStyle textStyle;

  _ReadContentWidgetState(this.content,this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[300],
      child: Text(content,overflow: TextOverflow.clip,style: textStyle)
      );
//      CustomPaint(
//        size: Size.infinite,
//        painter: MyPainter(content),
//      ),
//    );
  }

}

class MyPainter extends CustomPainter{
  String content;

  MyPainter(this.content);

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter()
    ..text = TextSpan(
      text: content,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black
      )
    );
    textPainter.paint(canvas, Offset(0, 0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
