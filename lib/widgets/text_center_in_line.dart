import 'package:flutter/material.dart';

class TextCenterInLine extends StatelessWidget {
  final String text;

  TextCenterInLine({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomSliverPersistentHeaderDelegate(
          max: 30,
          min: 30,
          child: Container(
              alignment: Alignment.center,
              child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Divider(height: 1, color: Colors.grey)),
                Text(text),
                Expanded(child: Divider(height: 1, color: Colors.grey))
              ]))),
    );
  }
}

// 自定义 SliverPersistentHeaderDelegate
class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double max; // 最大高度
  final double min; // 最小高度
  final Widget child; // 需要展示的内容

  CustomSliverPersistentHeaderDelegate(
      {@required this.max, @required this.min, @required this.child})
      // 如果 assert 内部条件不成立，会报错
      : assert(max != null),
        assert(min != null),
        assert(child != null),
        assert(min <= max),
        super();

  // 返回展示的内容，如果内容固定可以直接在这定义，如果需要可扩展，这边通过传入值来定义
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => max; // 返回最大高度

  @override
  double get minExtent => min; // 返回最小高度

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.max ||
        min != oldDelegate.min ||
        child != oldDelegate.child;
  }
}
