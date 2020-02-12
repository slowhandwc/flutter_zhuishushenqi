import 'package:flutter/material.dart';

class BookFindPage extends StatefulWidget {
  @override
  _BookFindPageState createState() => _BookFindPageState();
}

class _BookFindPageState extends State<BookFindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('发现'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: 60,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'book_category');
                        },
                        child: Card(
                          color: Colors.blueAccent,
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.category, color: Colors.white),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('分类',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)))
                              ],
                            ),
                          ),
                        )))),
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: 60,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('book_rank');
                        },
                        child: Card(
                          color: Colors.purple,
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.receipt, color: Colors.white),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('排行',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)))
                              ],
                            ),
                          ),
                        )))),
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: 60,
                    child: GestureDetector(
                        onTap: () {
                          ///todo
                        },
                        child: Card(
                            color: Colors.redAccent,
                            child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.bookmark, color: Colors.white),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text('书单',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)))
                                    ]))))))
          ],
        ),
      ),
    );
  }
}
