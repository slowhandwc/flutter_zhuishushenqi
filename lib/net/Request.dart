import 'dart:convert';

import 'package:flutter_novel/config/request_manager.dart';
import 'package:flutter_novel/config/service_url.dart';
import 'package:flutter_novel/models/BookCategories.dart';
import 'package:flutter_novel/models/BookDetail.dart';
import 'package:flutter_novel/models/BookList.dart';
import 'package:flutter_novel/models/BookRank.dart';
import 'package:flutter_novel/models/BookRankDetailResult.dart';
import 'package:flutter_novel/models/BookResource.dart';
import 'package:flutter_novel/models/ChapterContent.dart';
import 'package:flutter_novel/models/ChapterContentResult.dart';
import 'package:flutter_novel/models/ChapterList.dart';
import 'package:flutter_novel/models/RecommendBookList.dart';
import 'package:flutter_novel/models/ShortPostCount.dart';
import 'package:flutter_novel/models/ShortPostList.dart';

Future<BookList> getBookList(int index,int limit) async {
  var response = await get(bookListUrl, {
    'duration': 'all',
    'sort': 'created',
    'start': index,
    'limit': limit,
    'tag': '古代',
    'gender': 'female'
  });
  return BookList.fromJson(response.data);
}

///获取书籍分类
Future<BookCategories> getBookCats() async{
  var response = await get(getBookCatsUrl, {});
  return BookCategories.fromJson(response.data);
}

///获取数据所有排行
Future<BookRank> getBookAllRank() async{
  var response = await get(bookAllRankUrl,{});
  return BookRank.fromJson(response.data);
}

///获取排行详情
Future<BookRankDetailResult> getRankDetails(String id) async{
  var response = await get(bookRankUrl + id,{});
  return BookRankDetailResult.fromJson(response.data);
}

///获取书籍详情
Future<BookDetail> getBookDetail(String bookId) async{
  var response = await get(getBookInfoDetailUrl(bookId),{});
  return BookDetail.fromJson(response.data);
}
///获取短评列表
Future<ShortPostList> getHotShortPostList(String bookId) async{
  var response = await get(getHotPostListUrl(bookId),{'block':'short_review'});
  return ShortPostList.fromJson(response.data);
}
///获取短评列表
Future<ShortPostList> getHotPostList(String bookId) async{
  var response = await get(getHotPostListUrl(bookId),{'block':'review'});
  return ShortPostList.fromJson(response.data);
}
///获取短评数量
Future<ShortPostCount> getShortPostCount(String bookId) async{
  var response = await get(getHotPostCountUrl(bookId),{'range':''});
  return ShortPostCount.fromJson(response.data);
}
///获取推荐书籍
Future<RecommendBookList> getRecommendBook(String bookId) async{
  var response = await get(getRecommendBookListUrl(bookId),{});
  return RecommendBookList.fromJson(response.data);
}
///获取书籍源list
Future<List<BookResource>> getBookResourceList(String bookId) async{
  var response = await get(getBookResourceLink,{'view':'summary','book':bookId});
  var list = response.data as List<dynamic>;
  return list.map((item) => BookResource.fromJson(item)).toList();
}
///获取书籍章节列表
Future<ChapterList> getBookChapterList(String bookId) async{
  var response = await get(getChapterListUrl(bookId), {});
  return ChapterList.fromJson(response.data);
}

///获取书籍章节内容
Future<ChapterContent> getBookChapterContent(String link) async{
  var response = await get(getChapterContentUrl(link), {});
  return ChapterContentResult.fromJson(response.data).chapter;
}






