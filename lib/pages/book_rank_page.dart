import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novel/config/service_url.dart';
import 'package:flutter_novel/models/Book.dart';
import 'package:flutter_novel/models/BookRank.dart';
import 'package:flutter_novel/models/BookRankDetailResult.dart';
import 'package:flutter_novel/models/RankInfo.dart';
import 'package:flutter_novel/net/Request.dart';
import 'package:flutter_novel/pages/book_info_detail_page.dart';
import 'package:flutter_novel/widgets/left_menu.dart';

class BookRankPage extends StatefulWidget {
  @override
  _BookRankPageState createState() => _BookRankPageState();
}

class _BookRankPageState extends State<BookRankPage>
    with TickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabs = [Tab(text: '男频'), Tab(text: '女频'), Tab(text: '出版')];

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('排行榜', style: TextStyle(color: Colors.black, fontSize: 20)),
          leading: BackButton(color: Colors.red),
          brightness: Brightness.light,

          ///改变statusbar 颜色
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey,
//            labelStyle: TextStyle(color: Colors.redAccent),
//            unselectedLabelStyle: TextStyle(color: Colors.grey),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(style: BorderStyle.none)),
          )),
      body: FutureBuilder(
          builder: (context, snap) {
            if (!snap.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            BookRank bookRank = snap.data as BookRank;
            if (!bookRank.ok) {
              return Center(
                child: RaisedButton(
                    child: Text('请点击重试'),
                    onPressed: () {
                      setState(() {});
                    }),
              );
            }
            return Container(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Container(child: OneTypeRankPage(bookRank.male)),
                  Container(child: OneTypeRankPage(bookRank.female)),
                  Container(child: OneTypeRankPage(bookRank.epub))
                ],
              ),
            );
          },
          future: getBookAllRank()),
    );
  }
}

class OneTypeRankPage extends StatefulWidget {
  final List<RankInfo> rankTitles;

  OneTypeRankPage(this.rankTitles) : super();

  @override
  _OneTypeRankPageState createState() => _OneTypeRankPageState(rankTitles);
}

class _OneTypeRankPageState extends State<OneTypeRankPage> {
  final List<RankInfo> rankTitles;
  int selectedRankIndex = 0;

  _OneTypeRankPageState(this.rankTitles) : super() {
    selectedRankIndex = 0;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [];
    for (var item in rankTitles) {
      titleList.add(item.shortTitle);
    }
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: LeftMenu(
              children: titleList,
              defaultChoosenIndex: selectedRankIndex,
              listener: (index) {
                setState(() {
                  selectedRankIndex = index;
                });
              },
              margin: EdgeInsets.only(top: 10)),
        ),
        Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: FutureBuilder(
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    BookRankDetailResult bookRankDetailResult =
                        snap.data as BookRankDetailResult;
                    if (!bookRankDetailResult.ok) {
                      return Center(
                        child: RaisedButton(
                            child: Text('请点击重试'),
                            onPressed: () {
                              setState(() {});
                            }),
                      );
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: _buildRankListItem(
                                bookRankDetailResult.ranking.books[index],
                                index),
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) {
                                return BookInfoDetailPage(
                                    bookId: bookRankDetailResult
                                        .ranking.books[index].id);
                              }));
                            },
                          );
                        },
                        itemCount: bookRankDetailResult.ranking.books.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 10,
                          );
                        });
                  },
                  future: getRankDetails(rankTitles[selectedRankIndex].id)),
            ))
      ],
    );
  }

  _buildRankListItem(Book book, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(imageBaseUrl + book.cover),
            )),
        Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 120,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('${index + 1}.${book.title}',
                          style: TextStyle(fontSize: 18)),
                      Text(book.shortIntro,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Expanded(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(book.author,
                                            style: TextStyle(fontSize: 10)),
//                                        Text(book.minorCate,style: TextStyle(fontSize: 12)),
                                        Container(
                                          width: 40,
                                          height: 20,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              RaisedButton(
                                                onPressed: () {},
                                                elevation: 0,
                                                color: Colors.grey[300],
                                                shape: StadiumBorder(),
                                              ),
                                              Text(book.minorCate,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8))
                                            ],
                                          ),
                                        )
                                      ]))))
                    ]))),
      ],
    );
  }
}
