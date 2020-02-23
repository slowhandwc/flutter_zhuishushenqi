///api base地址
const apiBaseUrl= 'http://api.zhuishushenqi.com';
const apiBaseUrl2 = 'http://bookapi01.zhuishushenqi.com';
///书评 base地址
const communitBaseUrl = 'http://community.zhuishushenqi.com';
///图片 base地址
const imageBaseUrl= 'http://statics.zhuishushenqi.com';
///章节 base地址
const chapterBaseUrl= 'http://chapterup.zhuishushenqi.com';
///章节 列表base地址
const chapterListBaseUrl = apiBaseUrl + '/mix-atoc';
///书籍所有排行
const bookAllRankUrl = apiBaseUrl + '/ranking/gender';
///单个排行列表
const bookRankUrl = apiBaseUrl + '/ranking/';
///书单列表
const bookListUrl = apiBaseUrl + '/book-list';
///获取书籍详情
String getBookInfoDetailUrl(String bookId){
  return apiBaseUrl + '/book/'+bookId;
}

///书籍热门评论列表
String getHotPostListUrl(String bookId){
  return communitBaseUrl + '/forum/book/'+bookId+'/hot';
}

///书籍热门评论数量
String getHotPostCountUrl(String bookId){
  return communitBaseUrl + '/forum/book/'+bookId+'/statistic';
}
///获取推荐小说
String getRecommendBookListUrl(String bookId){
  return apiBaseUrl + '/book/' + bookId + '/recommend';
}

///章节列表地址获取
String getChapterListUrl(String resourceId){
  return getBookResourceLink + "/$resourceId"+"?view=chapters";
}

///章节列表地址获取
String getChapterContentUrl(String link){
  return chapterBaseUrl + '/chapter/'+link;
}

///获取小说源
const getBookResourceLink = apiBaseUrl2 + "/btoc";

///获取书籍分类
const getBookCatsUrl = apiBaseUrl + "/cats/lv2/statistics";

///获取书籍二级分类
const getBookCatsLv2Url = apiBaseUrl + "/cats/lv2";