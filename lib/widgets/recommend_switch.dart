import 'package:flutter/material.dart';
import 'package:flutter_zhuishushenqi/models/RecommendBook.dart';
import 'package:flutter_zhuishushenqi/utils/utils.dart';

///推荐组件
class RecommendSwitchWidget extends StatefulWidget {
  final List<RecommendBook> recommendList;

  RecommendSwitchWidget({this.recommendList});

  @override
  _RecommendSwitchWidgetState createState() =>
      _RecommendSwitchWidgetState(recommendList);
}

class _RecommendSwitchWidgetState extends State<RecommendSwitchWidget> {
  final List<RecommendBook> recommendList;
  int times = 1;

  _RecommendSwitchWidgetState(this.recommendList);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        child: _buildRecommends());
  }

  _buildRecommends() {
    List<Widget> items = [];
    if (recommendList.length > 4) {
      for (int i = (times - 1) * 4; i < times * 4; i++) {
        if (times * 4 >= recommendList.length) {
          if (i >= recommendList.length) {
            times = 1;
            break;
          } else {
            items.add(_buildRecommendItem(recommendList[i]));
          }
        } else {
          items.add(_buildRecommendItem(recommendList[i]));
        }
      }
      return Column(
        children: <Widget>[
          Row(children: items),
          Container(height: 1, color: Colors.grey[300]),
          GestureDetector(
            onTap: (){
              if(times*4 == recommendList.length){
                times = 1;
              } else {
                times++;
              }
              setState(() {});
            },
            child: Container(
              color:Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.refresh,color: Colors.red),Text('换一换',style: TextStyle(color: Colors.red,fontSize: 18))],
              ),
            )
          ),
        ],
      );
    } else {
      for (var item in recommendList) {
        items.add(_buildRecommendItem(item));
      }
      return Row(children: items);
    }
  }

  _buildRecommendItem(RecommendBook book) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
                elevation: 3,
                child: Image.network(getImageUrl(book.cover))),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5,left: 3),
              child: Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5,left: 3),
              child: Text('${book.otherReadRatio}%',
                  style: TextStyle(color: Colors.grey[500])),
            )

          ],
        ),
      )
    );
  }
}
