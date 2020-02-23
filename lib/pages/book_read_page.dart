import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_novel/db/dao/BookReadProcessDao.dart';
import 'package:flutter_novel/db/dao/ChapterContentDao.dart';
import 'package:flutter_novel/models/BookReadProcess.dart';
import 'package:flutter_novel/models/BookResource.dart';
import 'package:flutter_novel/models/Chapter.dart';
import 'package:flutter_novel/models/ChapterContent.dart';
import 'package:flutter_novel/models/ChapterContentPage.dart';
import 'package:flutter_novel/models/ChapterList.dart';
import 'package:flutter_novel/net/Request.dart';
import 'package:flutter_novel/utils/utils.dart';
import 'package:flutter_novel/widgets/read/read_bottom_widget.dart';
import 'package:flutter_novel/widgets/read/read_content_widget.dart';
import 'package:flutter_novel/widgets/read/read_head_widget.dart';

///书籍阅读page
class BookReadPage extends StatefulWidget {
  final String bookId;

  BookReadPage({this.bookId});
  @override
  _BookReadPageState createState() => _BookReadPageState(bookId);
}

class _BookReadPageState extends State<BookReadPage> {
  bool asyncWorksExceuted = false;
  PageController pageController;
  BookReadProcessDao mBookReadProcessDao = BookReadProcessDao();
  ChapterContentDao mChapterContentDao = ChapterContentDao();
  String bookId;
  int lastReadChapterIndex = 0;
  int lastReadChapterPage = 0;
  int mCurrentPageIndex = 0;
  double mPerPageWidth;
  double mPerPageHeight;
  TextStyle mTextStyle = TextStyle(fontSize: 20);
  ///章节列表
  ChapterList mChapterList;
  ///章节内容缓存列表
  List<ChapterContent> mChapterContentList = [];
  ///裁剪后的页列表
  List<ChapterContentPage> mChapterContentPageList = [];

  _BookReadPageState(this.bookId);

  @override
  void dispose() {
    mBookReadProcessDao.close();
    super.dispose();
  }

  @override
  void initState() {
    _future = asyncWorks();
    super.initState();
  }

  Future<String> _future;

  @override
  Widget build(BuildContext context) {
//    _textSize(content, TextStyle(fontSize: 15));
    mPerPageWidth = MediaQuery.of(context).size.width - 20;
    asyncWorksExceuted = false;
    return Material(
      child: Container(
        color: Colors.orange[300],
        child: SafeArea(
          ///获取章节列表
          child:  LayoutBuilder(builder: (context,constraints){
            print('all page maxheight=='+constraints.maxHeight.toString());
            mPerPageHeight = constraints.maxHeight/16*14;
            return FutureBuilder(
                future: _future,
                builder: (context,snap){
                  if(!snap.hasData){
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  } else if(snap.hasError){
                    return Center(
                        child: Text('${snap.error.toString()}')
                    );
                  }
                  return PageView.builder(controller:pageController,itemBuilder: (context,index){
                    var currentPage = mChapterContentPageList[index];
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ReadHeadWidget(chapterName: currentPage.chapterName),
                            ),
                            Expanded(
                                flex: 14,
                                child: LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      String pageContent = currentPage.pageContent;
                                      String content;
                                      if(pageContent.startsWith('\r\n')){
                                        content = pageContent.substring(2,pageContent.length);
                                      }else if(pageContent.startsWith('\n')){
                                        content = pageContent.substring(1,pageContent.length);
                                      } else {
                                        content = pageContent;
                                      }
                                      print('ReadContentWidget maxheight=='+constraints.maxHeight.toString());
                                      return ReadContentWidget(content: content,textStyle: mTextStyle);
                                    })
                            ),
                            Expanded(
                              flex: 1,
                              child: ReadBottomWidget(allPageCount: currentPage.chapterPageCount,currentPage: currentPage.pageIndex+1,chapterReviewCount: 563),
                            )
                          ],
                        )
                    );
                  },onPageChanged: (index){
                    saveBookReadProcess(mChapterContentPageList[index].chapterIndex,mChapterContentPageList[index].pageIndex);
                  });
                }
            );
          }),
        )
      )
    );
  }

  ///异步任务
  Future<String> asyncWorks() async{
    if(!asyncWorksExceuted){
      asyncWorksExceuted = true;
      List<BookResource> bookResourceList = await getBookResourceList(bookId);
      ChapterList chapterList = await getBookChapterList(bookResourceList[0].id);
      mChapterList = chapterList;
      return await init();
    }
  }

  ///裁剪章节内容分页
  List<ChapterContentPage> cutChapterToPages(String chapterName,String chapterContent,TextStyle style,double perPageHeight,double perPageWidth,int chapterIndex){
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: chapterContent, style: style), textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: perPageWidth);
    List<LineMetrics> lineMerics = textPainter.computeLineMetrics();
    var lineHeight = lineMerics[0].height;
    int linesPerPage = (perPageHeight / lineHeight -1).toInt();
    var scaledPerPageHeight = linesPerPage * lineHeight;
    var pageCount = 0;
    if(lineMerics.length % linesPerPage != 0){
      pageCount = lineMerics.length ~/ linesPerPage +1;
    } else {
      pageCount = lineMerics.length ~/ linesPerPage;
    }
    List<ChapterContentPage> pageContentsList = [];
    var offsetPoint = 0;
    for(var i = 0;i<pageCount;i++){
      int offset = textPainter.getPositionForOffset(Offset(textPainter.width,(i+1)*scaledPerPageHeight - lineHeight)).offset;
      ChapterContentPage chapterContentPage = ChapterContentPage();
      chapterContentPage.chapterName = chapterName;
      chapterContentPage.pageContent = chapterContent.substring(offsetPoint,offset);
      chapterContentPage.pageIndex = i;
      chapterContentPage.chapterIndex = chapterIndex;
      chapterContentPage.chapterPageCount = pageCount;
      pageContentsList.add(chapterContentPage);
      offsetPoint = offset;
    }
    return pageContentsList;
  }

  ///通过章节编号获取章节
  ChapterContent getChapterContentByOrder(int order,List<ChapterContent> chapterContentList){
    for(ChapterContent item in chapterContentList){
      if(item.chapterOrder == order){
        return item;
      }
    }
    return null;
  }

  ///初始化
  Future<String> init() async {
    ///先获取上次阅读的地方在哪
    BookReadProcess bookReadProcess = await getLastReadProcess();
    ///获取数据库缓存章节
    List<ChapterContent> diskCachedChapterContentList = await getDiskCachedChapterContentList();
    ///数据库没有缓存的章节，需下载
    if(diskCachedChapterContentList.length == 0){
      for(int i=0;i<4;i++){
        Chapter chapter = mChapterList.chapters[i];
        mChapterContentList.add(await cacheOneChapterContent(chapter.link));
      }
    } else {
      ///先全部加入到内存当中
      mChapterContentList.addAll(diskCachedChapterContentList);
    }
    ///不是第一次阅读
    if(bookReadProcess != null) {
      lastReadChapterIndex = bookReadProcess.readChapterIndex;
      lastReadChapterPage = bookReadProcess.readPageIndex;
    }
    ///缓存从这章开始四章
    for(int i=0;i<4;i++){
      if(lastReadChapterIndex+i>mChapterList.chapters.length){
        break;
      }

      var chapterContent = await getOneChapterContentFromCache(lastReadChapterIndex+i+1);
      if(!mChapterContentList.contains(chapterContent)){
        mChapterContentList.add(chapterContent);
      }
      List<ChapterContentPage> contentPageList = cutChapterToPages(chapterContent.title,chapterContent.cpContent,mTextStyle,mPerPageHeight,mPerPageWidth,lastReadChapterIndex+i);
      mChapterContentPageList.addAll(contentPageList);
    }
    ///缓存上次阅读前面几章
    if(lastReadChapterIndex>0){
      for(int i = lastReadChapterIndex-1;i>=lastReadChapterIndex-4;i--){
        if(i < 0){
          break;
        }
        var chapterContent = await getOneChapterContentFromCache(i+1);
        if(!mChapterContentList.contains(chapterContent)){
          mChapterContentList.add(chapterContent);
        }
        List<ChapterContentPage> contentPageList = cutChapterToPages(chapterContent.title,chapterContent.cpContent,mTextStyle,mPerPageHeight,mPerPageWidth,i);
        mChapterContentPageList.insertAll(0, contentPageList);
      }
    }
    for(var i = 0;i<mChapterContentPageList.length;i++){
      if(mChapterContentPageList[i].chapterIndex == lastReadChapterIndex){
        if(mChapterContentPageList[i].pageIndex == lastReadChapterPage){
          mCurrentPageIndex = i;
        }
      }
    }
    pageController = PageController(initialPage: mCurrentPageIndex);
    return 'ok';
  }

  ///获取上次阅读进度
  Future<BookReadProcess> getLastReadProcess() async {
    ///先获取上次阅读的地方在哪
    BookReadProcess bookReadProcess = await mBookReadProcessDao.getBookReadProcessByBookId(bookId);
    return bookReadProcess;
  }

  ///保存阅读进度
  saveBookReadProcess(int lastReadChapterIndex,int lastReadPageIndex) async{
    BookReadProcess bookReadProcess = await mBookReadProcessDao.getBookReadProcessByBookId(bookId);
    if(bookReadProcess == null){
      bookReadProcess = BookReadProcess();
      bookReadProcess.bookId = bookId;
      bookReadProcess.readChapterIndex = lastReadChapterIndex;
      bookReadProcess.readPageIndex = lastReadPageIndex;
      bookReadProcess.lastReadTime = getTimeNowFormatString();
      mBookReadProcessDao.insert(bookReadProcess);
    } else {
      bookReadProcess.readChapterIndex = lastReadChapterIndex;
      bookReadProcess.readPageIndex = lastReadPageIndex;
      bookReadProcess.lastReadTime = getTimeNowFormatString();
      mBookReadProcessDao.update(bookReadProcess);
    }

  }

  ///获取数据库缓存的章节内容列表
  Future<List<ChapterContent>> getDiskCachedChapterContentList() async {
      List<ChapterContent> diskCachedCHapterContentList = await mChapterContentDao.getChapterContentByBookId(bookId);
      return diskCachedCHapterContentList;
  }

  ///缓存一章内容
  Future<ChapterContent> cacheOneChapterContent(String link) async{
    ChapterContent chapterContent = await getBookChapterContent(link);
    mChapterContentDao.insert(chapterContent);
    return chapterContent;
  }

  ///从缓存获取一章chapterConent
  Future<ChapterContent> getOneChapterContentFromCache(int order) async{
    var chapterContent = getChapterContentByOrder(order,mChapterContentList);
    if(chapterContent == null){
      chapterContent = await cacheOneChapterContent(mChapterList.chapters[order-1].link);
    }
    return chapterContent;
  }

}

