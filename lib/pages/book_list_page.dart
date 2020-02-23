import 'package:flutter/material.dart';
import 'package:flutter_novel/db/SqliteHelper.dart';
import 'package:flutter_novel/db/dao/BookDao.dart';
import 'package:flutter_novel/models/Book.dart';
import 'package:flutter_novel/utils/utils.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Widget> bookListGridList = [
    IconButton(icon: Icon(Icons.add_circle_outline))
  ];
  BookDao bookDao = BookDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bookDao.close();
    super.dispose();
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
                  var bookList = snap.data as List<Book>;
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.66),
                      itemBuilder: (BuildContext context, int index) {
                        var book = bookList[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('book_read',arguments: book.id);
                          },
                          child: Container(
                              child: Column(
                                children: <Widget>[
                                  Expanded(flex:6,child:Image.network(getImageUrl(book.cover),fit: BoxFit.fill)),
                                  Expanded(flex: 1, child: Text(book.title,style: TextStyle(fontSize: 20))),
                                  Expanded(flex: 1, child: Text(book.lastChapter,overflow: TextOverflow.ellipsis)),
                                ],
                              )
                          ),
                        );
                      },itemCount: bookList.length);
                }
                return Center(child: Text('书架空空如也，请搜索添加吧!'));
              },
              future: _getList()))
    );
  }

  Future<List<Book>> _getList() async{
    return bookDao.getBookList();
  }
}
