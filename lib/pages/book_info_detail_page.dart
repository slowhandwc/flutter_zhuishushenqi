import 'package:flutter/material.dart';
import 'package:flutter_zhuishushenqi/db/SqliteHelper.dart';
import 'package:flutter_zhuishushenqi/db/dao/BookDao.dart';
import 'package:flutter_zhuishushenqi/models/Book.dart';
import 'package:flutter_zhuishushenqi/models/BookDetail.dart';
import 'package:flutter_zhuishushenqi/models/RecommendBookList.dart';
import 'package:flutter_zhuishushenqi/models/ShortPostCount.dart';
import 'package:flutter_zhuishushenqi/models/ShortPostItem.dart';
import 'package:flutter_zhuishushenqi/models/ShortPostList.dart';
import 'package:flutter_zhuishushenqi/net/Request.dart';
import 'package:flutter_zhuishushenqi/utils/utils.dart';
import 'package:flutter_zhuishushenqi/widgets/recommend_switch.dart';
import 'package:flutter_zhuishushenqi/widgets/score_star.dart';
import 'package:flutter_zhuishushenqi/widgets/tag_wall.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///书籍详情界面
class BookInfoDetailPage extends StatefulWidget {
  final String bookId;

  BookInfoDetailPage({Key key, this.bookId}) : super(key: key);

  @override
  _BookInfoDetailPageState createState() => _BookInfoDetailPageState(bookId);
}

class _BookInfoDetailPageState extends State<BookInfoDetailPage> {
  final String bookId;
  final BookDao bookDao = new BookDao();
  BookDetail bookDetail;

  _BookInfoDetailPageState(this.bookId);

  @override
  void dispose() {
    bookDao.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Material(
                child: FutureBuilder(
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      bookDetail = snap.data as BookDetail;
                      if (bookDetail.id == null) {
                        showToast('请稍后再试');
                        return RaisedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('点击重试'),
                        );
                      }
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            centerTitle: true,
                            title: Text(bookDetail.title),
                            actions: <Widget>[
                              IconButton(icon: Icon(Icons.share), onPressed: () {}),
                              IconButton(icon: Icon(Icons.message), onPressed: () {})
                            ],
                            pinned: true,
                            expandedHeight: 170,
                            flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.parallax,
                              background: DecoratedBox(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.grey[500],
                                            Colors.grey[800]
                                          ])),
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                              height: 100,
                                              child: Container(
                                                  margin: EdgeInsets.only(left: 20),
                                                  child: Image.network(
                                                      getImageUrl(bookDetail.cover)))),
                                          Expanded(
                                            child: Container(
                                              height: 100,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(bookDetail.title,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18)),
                                                  Container(
                                                      height: 21,
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(bookDetail.author,
                                                              textAlign:
                                                              TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .yellow[600])),
                                                          Container(
                                                            height: 12,
                                                            width: 1,
                                                            alignment: Alignment.center,
                                                            margin:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 10),
                                                            color: Colors.white,
                                                          ),
                                                          Text(bookDetail.copyright,
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.grey[350]))
                                                        ],
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Text(
                                                          '${bookDetail.wordCount ~/ 10000}万字',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.grey[350])))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))),
                            ),
                          ),

                          ///评分区
                          SliverToBoxAdapter(
                              child: Container(
                                  height: 100,
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                              height: 60,
                                              margin: EdgeInsets.only(left: 15),
                                              child: Column(
                                                children: <Widget>[
                                                  ScoreStarWidget(
                                                      score: bookDetail.rating.score,
                                                      showScore: true),
                                                  Container(
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                              '${bookDetail.rating.count}人参与评分',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.grey)),
                                                          Container(
                                                              alignment: Alignment.center,
                                                              child: Icon(
                                                                Icons.keyboard_arrow_right,
                                                                size: 15,
                                                              ))
                                                        ],
                                                      ))
                                                ],
                                              ))),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            height: 60,
                                            child: Column(
                                              children: <Widget>[
                                                Text(bookDetail.retentionRatio + "%",
                                                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                                                Text('读者留存',
                                                    style: TextStyle(fontSize: 10, color: Colors.grey))
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            height: 60,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                    '${bookDetail.latelyFollower ~/ 10000}万',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey)),
                                                Text('7日人气',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey))
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            height: 60,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                    '${bookDetail.totalFollower ~/ 10000}万',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey)),
                                                Text('累积人气',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey))
                                              ],
                                            )),
                                      )
                                    ],
                                  ))),

                          ///简介区
                          SliverToBoxAdapter(
                              child: Container(
                                  color: Colors.white,
                                  padding:
                                  EdgeInsets.only(left: 20, right: 20, bottom: 10),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text('简介', style: TextStyle(fontSize: 20)),
                                        TagsWallWidget(tags: bookDetail.tags),
                                        Text(bookDetail.longIntro,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(fontSize: 15)),
                                        Container(
                                            height: 1,
                                            margin: EdgeInsets.symmetric(vertical: 20),
                                            color: Colors.grey[300]),
                                        Stack(
                                          fit: StackFit.passthrough,
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text('目录',
                                                    style: TextStyle(fontSize: 20)),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  size: 20,
                                                  color: Colors.grey[500],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                ///todo 时间显示控件
                                                Text(
                                                  bookDetail.lastChapter,
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ]))),
                          SliverToBoxAdapter(
                              child: Container(
                                height: 10,
                                color: Colors.grey[300],
                              )),
                          ///热门评论区
                          SliverToBoxAdapter(
                              child: FutureBuilder(
                                  builder:
                                      (BuildContext context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                    ShortPostList shortPostList = snapshot.data as ShortPostList;
                                    return Container(
                                        color: Colors.white,
//                                padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.symmetric(vertical: 10),
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Row(children: <Widget>[
                                                      Text('热门短评', style: TextStyle(fontSize: 20)),
                                                      Container(margin: EdgeInsets.only(left: 10),
                                                          child: Text('${bookDetail.postCount}条', style: TextStyle(fontSize: 12, color: Colors.grey[500])))
                                                    ]),
                                                    GestureDetector(
                                                        onTap: () {

                                                        },
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(Icons.create,color: Colors.red,size: 15),
                                                            Container(
                                                                margin: EdgeInsets.only(left:2),
                                                                child: Text('写短评', style: TextStyle(fontSize: 14, color: Colors.red))
                                                            )
                                                          ],
                                                        )
                                                    )
                                                  ],
                                                )),
                                            Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 20), color: Colors.grey[300]),
                                            Container(
                                                height: 150,
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                child: Swiper(
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: shortPostList.posts.length,
                                                  itemBuilder: (context, index) {
                                                    return _buildShortPostSwiperItem(
                                                        shortPostList.posts[index]);
                                                  },
                                                  autoplay: true,
                                                )),
                                            Column(children: <Widget>[
                                              Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 20), color: Colors.grey[300]),
                                              FutureBuilder(
                                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Center(child: CircularProgressIndicator());
                                                    }
                                                    ShortPostCount shortPostCount = snapshot.data as ShortPostCount;
                                                    return Column(
                                                      children: <Widget>[
                                                        GestureDetector(
                                                            onTap: () {
                                                              ///todo all short review
                                                            },
                                                            child: Container(
                                                              height: 50,
                                                              color: Colors.white,
                                                              alignment:
                                                              Alignment.center,
                                                              child: Text(
                                                                  '查看全部${shortPostCount.shortReview}条短评',
                                                                  style: TextStyle(color: Colors.red, fontSize: 16)),
                                                            )),
                                                        Container(
                                                          height: 10,
                                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                                          color: Colors.grey[300],
                                                        ),
                                                        Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 20),
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                    margin: EdgeInsets.only(top: 10),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: <Widget>[
                                                                        Row(children: <Widget>[
                                                                          Text('热门书评', style: TextStyle(fontSize: 20)),
                                                                          Container(margin:EdgeInsets.only(left: 10),child: Text('${shortPostCount.review}条', style: TextStyle(fontSize: 12, color: Colors.grey[500])))
                                                                        ],
                                                                        ),
                                                                        GestureDetector(
                                                                            onTap: () {
                                                                              ///todo write 书评
                                                                            },
                                                                            child: Row(
                                                                              children: <Widget>[
                                                                                Icon(Icons.create,color: Colors.red,size: 15),
                                                                                Container(
                                                                                    margin: EdgeInsets.only(left:2),
                                                                                    child: Text('写书评', style: TextStyle(fontSize: 14, color: Colors.red))
                                                                                )
                                                                              ],
                                                                            ))
                                                                      ],
                                                                    )),
                                                                Container(
                                                                  height: 1,
                                                                  margin: EdgeInsets.only(top: 10),
                                                                  color: Colors.grey[300],
                                                                ),
                                                                FutureBuilder(
                                                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                                    if (!snapshot.hasData) {
                                                                      return Center(child: CircularProgressIndicator());
                                                                    }
                                                                    ShortPostList hotPostList = snapshot.data as ShortPostList;
                                                                    return _buildPostList(hotPostList);
                                                                  },
                                                                  future: getHotPostList(bookId),
                                                                ),
                                                              ],
                                                            )),
                                                        Container(
                                                          height: 1,
                                                          color: Colors.grey[300],
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              ///todo all short review
                                                            },
                                                            child: Container(
                                                              height: 50,
                                                              color: Colors.white,
                                                              alignment:
                                                              Alignment.center,
                                                              child: Text(
                                                                  '查看全部${shortPostCount.review}条书评',
                                                                  style: TextStyle(color: Colors.red, fontSize: 16)),
                                                            ))
                                                      ],
                                                    );
                                                  },
                                                  future: getShortPostCount(bookId))
                                            ],
                                            )
                                          ],
                                        ));
                                  },
                                  future: getHotShortPostList(bookId))),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 10,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.grey[300],
                            ),
                          ),
                          SliverToBoxAdapter(
                              child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('本书的追友还在读这些书',style: TextStyle(fontSize: 16))
                                      ),
                                      Container(
                                          height: 1,
                                          color:Colors.grey[300],
                                          padding: EdgeInsets.symmetric(horizontal: 20)
                                      ),
                                      FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child: CircularProgressIndicator());
                                        }
                                        RecommendBookList recommendBookList = snapshot.data as RecommendBookList;
                                        return RecommendSwitchWidget(recommendList:recommendBookList.books);
                                      },
                                        future: getRecommendBook(bookId),
                                      ),
                                    ],
                                  )
                              )
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 10,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.grey[300],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('图书信息',style: TextStyle(fontSize: 16)),
                                  ),
                                  Text('版权: ${bookDetail.copyrightInfo}',overflow: TextOverflow.visible,style: TextStyle(fontSize: 12,color:Colors.grey[500]))
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 10,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    height: 100,
                                  )
                                ]
                            ),
                          ),
                        ],
                      );
                    },
                    future: getBookDetail(bookId))),
            Container(
                height: 60,
                color: Colors.white,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(color: Colors.grey[300],height: 1),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: (){
                                  Book book = Book();
                                  book.fromBookDetail(bookDetail);
                                  bookDao.insert(book);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2),
                                        child: Icon(Icons.add,color: Colors.red)
                                    ),
                                    Text('追更新',style: TextStyle(fontSize: 20,color: Colors.red))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.red,
                                    child: Text('开始阅读',style: TextStyle(color: Colors.white,fontSize: 20))
                                )
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                      child: Icon(Icons.file_download,color: Colors.red)
                                  ),
                                  Text('下载',style: TextStyle(fontSize: 20,color: Colors.red))
                                ],
                              ),
                            )
                          ],
                        )
                      )
                    ],
                  ),
                )
            )
          ]
      )
    );
  }

///构建热门短评展示
  _buildShortPostSwiperItem(ShortPostItem shortPostItem) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(getImageUrl(shortPostItem.author.avatar)),
                  radius: 12,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(shortPostItem.author.nickname,
                        style: TextStyle(fontSize: 14))),
                Container(
                    height: 40,
                    child: Transform(
                      alignment: Alignment.center,
                      child: Chip(
                        label: Text('Lv.${shortPostItem.author.lv}'),
                      ),
                      transform: Matrix4.identity()..scale(0.6),
                    ))
              ],
            ),
            ScoreStarWidget(
                score: shortPostItem.rating * 2.toDouble(), showScore: false),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(shortPostItem.content,
                    overflow: TextOverflow.ellipsis, maxLines: 2))
          ],
        ));
  }

///构建热门评论列表
  _buildPostList(ShortPostList hotPostList){
    List<Widget> items = [];
    for(var item in hotPostList.posts){
      items.add(Container(
          height: 160,
          child: Column(
            children: <Widget>[
              _buildShortPostSwiperItem(item),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${item.readCount}阅读'),
                    Row(children: <Widget>[
                      Row(
                        children: <Widget>[Icon(Icons.chat,size: 10),Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text('${item.commentCount}')
                        )],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: <Widget>[Icon(Icons.music_note,size: 10),Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text('${item.likeCount}')
                            )],
                          )
                      ),
                    ])
                  ],
                ),
              )
            ],
          )
      ));
    }
    return Column(
      children: items,
    );
  }
}
