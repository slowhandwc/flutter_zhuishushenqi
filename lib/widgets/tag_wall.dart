import 'package:flutter/material.dart';

class TagsWallWidget extends StatefulWidget {
  final List<String> tags;

  TagsWallWidget({@required this.tags});
  @override
  _TagsWallWidgetState createState() => _TagsWallWidgetState(tags);
}

class _TagsWallWidgetState extends State<TagsWallWidget> {
  final List<String> tags;

  _TagsWallWidgetState(this.tags);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildTagsWall(tags),
    );
  }

  _buildTagsWall(List<String> tags) {
    List<Transform> tagList = [];
    for(var item in tags){
      tagList.add(Transform(
          transform: new Matrix4.identity()..scale(0.7),
        child: Chip(
          label: Text(item,style: TextStyle(fontSize: 14,color: Colors.grey[700])),
        )
      ));
    }
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: tagList,
    );
  }
}
