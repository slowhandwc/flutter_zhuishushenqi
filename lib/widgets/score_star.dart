import 'package:flutter/material.dart';

///评分星星组件
class ScoreStarWidget extends StatefulWidget {
  final double score;

  final bool showScore;

  ScoreStarWidget({this.score, this.showScore = false});

  @override
  _ScoreStarWidgetState createState() =>
      _ScoreStarWidgetState(score, showScore);
}

class _ScoreStarWidgetState extends State<ScoreStarWidget> {
  final double score;

  final bool showScore;

  _ScoreStarWidgetState(this.score, this.showScore);

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildStars(score));
  }

  _buildStars(double score) {
    double widthAndheight = 20;
    double starSize = 16;
    var tempScore = score;
    List<Widget> icons = [];
    if (tempScore > 0) {
      for (int i = 0; i < 5; i++) {
        tempScore -= 2;
        if (tempScore >= 0) {
          icons.add(Container(
//              width: widthAndheight,
//              height: widthAndheight,
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Icon(Icons.star, color: Colors.yellow,size: starSize)));
        } else if (tempScore > -2 && tempScore < 0) {
          icons.add(Container(
//              width: widthAndheight,
//              height: widthAndheight,
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Icon(Icons.star_half, color: Colors.yellow,size: starSize)));
        } else {
          icons.add(Container(
//              width: widthAndheight,
//              height: widthAndheight,
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Icon(Icons.star_border, color: Colors.yellow,size: starSize)));
        }
      }
    } else {
      for (int i = 0; i < 5; i++) {
        icons.add(Container(
//            width: widthAndheight,
//            height: widthAndheight,
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.star_border, color: Colors.yellow,size: starSize)));
      }
    }
    if (showScore) {
      icons.insert(
          0,
          Container(
              child: Text(score.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey))));
    }
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: icons);
  }
}
