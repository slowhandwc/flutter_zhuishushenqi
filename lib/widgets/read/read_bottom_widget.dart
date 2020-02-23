import 'package:flutter/material.dart';
import 'package:flutter_zhuishushenqi/utils/utils.dart';

class ReadBottomWidget extends StatelessWidget {
  final int allPageCount;
  final int currentPage;
  final int chapterReviewCount;

  ReadBottomWidget({this.currentPage,this.allPageCount,this.chapterReviewCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.rotate(angle: 90,child: Icon(Icons.battery_std)),
                  Text(getTimeNowFormatString())
                ])
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text('共$chapterReviewCount条章评')
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text('第$currentPage/$allPageCount页')
            ),
          )
        ],
      )
    );
}
}
