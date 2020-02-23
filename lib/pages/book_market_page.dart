import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_zhuishushenqi/config/service_url.dart';
import 'package:flutter_zhuishushenqi/models/Book.dart';
import 'package:flutter_zhuishushenqi/models/BookList.dart';
import 'package:flutter_zhuishushenqi/net/Request.dart';
import 'package:flutter_zhuishushenqi/utils/utils.dart';

class BookMarketPage extends StatefulWidget {
  @override
  _BookMarketPageState createState() => _BookMarketPageState();
}

class _BookMarketPageState extends State<BookMarketPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BookListWidget(),
    );
  }
}

class BookListWidget extends StatefulWidget {
  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookListWidget> {
  List<Book> books = [];
  int index = 0;
  int limit = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          builder: (context, snap) {
            if (snap.hasData) {
              BookList bookList = (snap.data as BookList);
              if (bookList.ok) {
                return EasyRefresh(
                    onRefresh: () async {
                      index = 0;
                      books.clear();
                      setState(() {});
                    },
                    onLoad: () async {
                      index += 1;
                      setState(() {});
                    },
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.66),
                        itemCount: index * limit + limit,
                        itemBuilder: (context, index) {
                          books.addAll(bookList.bookLists);
                          Book book = books[index];
                          String bookImgSrc = imageBaseUrl + book.cover;
                          return InkWell(
                              child: Card(
                                elevation: 5,
                                  child: Flex(
                                direction: Axis.vertical,
                                children: <Widget>[
                                  Expanded(
                                    flex: 6,
                                    child: Image.network(bookImgSrc),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(book.title,
                                          textAlign: TextAlign.center)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(book.author,
                                        textAlign: TextAlign.center),
                                  )
                                ],
                              )),
                              onTap: () {});
                        }));
              } else {
                showToast("请稍后再试!");
              }
            }
            return Center(
                child: RaisedButton(
                    child: Text('刷新'),
                    onPressed: () {
                      initState();
                    }));
          },
          future: getBookList(index, limit)),
    );
  }
}
