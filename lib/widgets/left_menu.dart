import 'package:flutter/material.dart';

GlobalKey<_LeftMenuState> leftMenuStateKey = GlobalKey();

class LeftMenu extends StatefulWidget {
  final List<String> children;
  final OnItemClickListener listener;
  final defaultChoosenIndex;
  final EdgeInsets margin;

  LeftMenu({Key key,this.children, this.defaultChoosenIndex, this.listener, this.margin}):super(key:key);

  @override
  _LeftMenuState createState() =>
      _LeftMenuState(children, defaultChoosenIndex, listener, margin);
}

typedef OnItemClickListener = void Function(int position);

class _LeftMenuState extends State<LeftMenu> {
  final List<String> children;
  final OnItemClickListener listener;
  int defaultChoosenIndex = 0;
  final EdgeInsets margin;

  _LeftMenuState(this.children, this.defaultChoosenIndex, this.listener, this.margin);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(index, children[index]);
        },
      ),
    );
  }

  _buildMenuItem(int index, String title) {
    var widget;
    var labelColor;
    var bgColor;
    if (index == defaultChoosenIndex) {
      labelColor = Colors.red;
      bgColor = Colors.grey[100];
    } else {
      labelColor = Colors.transparent;
      bgColor = Colors.transparent;
    }
    widget = Container(
        height: 50,
        color: bgColor,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  selectOne(index);
                  listener(index);
                },
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 2,
                          margin:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                          color: labelColor,
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(title, textAlign: TextAlign.center))
                      ],
                    )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 2,
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey[200],
                ))
          ],
        ));
    return widget;
  }

  selectOne(int index) {
    setState(() {
      defaultChoosenIndex = index;
    });
  }
}
