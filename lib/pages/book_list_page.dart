import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Widget> bookListGridList = [
    IconButton(icon: Icon(Icons.add_circle_outline))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('追书'),
          actions: <Widget>[
          IconButton(icon: Icon(Icons.category),tooltip: '分类',onPressed: (){
            Navigator.pushNamed(context, 'book_category');
          }),
          IconButton(icon: Icon(Icons.search),onPressed: (){
            //todo to searchPage
          })]
      ),
      body: Container(
          child: FutureBuilder(
              builder: (context, snap) {
                if (snap.hasData) {
                  return Row(
                    children: <Widget>[
                      GridView(
                          children: <Widget>[],
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 0.66))
                    ],
                  );
                }
                return Center(child: Text('书架空空如也，请搜索添加吧!'));
              },
              future: _getList()))
    );
  }

  Future _getList() {}
}
