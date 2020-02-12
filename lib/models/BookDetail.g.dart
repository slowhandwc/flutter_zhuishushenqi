// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetail _$BookDetailFromJson(Map<String, dynamic> json) {
  return BookDetail()
    ..id = json['_id'] as String
    ..longIntro = json['longIntro'] as String
    ..majorCateV2 = json['majorCateV2'] as String
    ..author = json['author'] as String
    ..minorCateV2 = json['minorCateV2'] as String
    ..majorCate = json['majorCate'] as String
    ..minorCate = json['minorCate'] as String
    ..title = json['title'] as String
    ..cover = json['cover'] as String
    ..creater = json['creater'] as String
    ..starRatingCount = json['starRatingCount'] as num
    ..starRatings = (json['starRatings'] as List)
        ?.map((e) =>
            e == null ? null : StarRating.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..isMakeMoneyLimit = json['isMakeMoneyLimit'] as bool
    ..contentLevel = json['contentLevel'] as num
    ..isFineBook = json['isFineBook'] as bool
    ..safelevel = json['safelevel'] as num
    ..allowFree = json['allowFree'] as bool
    ..originalAuthor = json['originalAuthor'] as String
    ..authorDesc = json['authorDesc'] as String
    ..rating = json['rating'] == null
        ? null
        : StarRating.fromJson(json['rating'] as Map<String, dynamic>)
    ..hasCopyright = json['hasCopyright'] as bool
    ..buytype = json['buytype'] as num
    ..sizetype = json['sizetype'] as num
    ..superscript = json['superscript'] as String
    ..currency = json['currency'] as num
    ..contentType = json['contentType'] as String
    ..allowMonthly = json['allowMonthly'] as bool
    ..allowVoucher = json['allowVoucher'] as bool
    ..allowBeanVoucher = json['allowBeanVoucher'] as bool
    ..hasCp = json['hasCp'] as bool
    ..banned = json['banned'] as num
    ..postCount = json['postCount'] as num
    ..totalFollower = json['totalFollower'] as num
    ..latelyFollower = json['latelyFollower'] as num
    ..followerCount = json['followerCount'] as num
    ..wordCount = json['wordCount'] as num
    ..serializeWordCount = json['serializeWordCount'] as num
    ..retentionRatio = json['retentionRatio'] as String
    ..updated = json['updated'] as String
    ..isSerial = json['isSerial'] as bool
    ..chaptersCount = json['chaptersCount'] as num
    ..lastChapter = json['lastChapter'] as String
    ..gender = (json['gender'] as List)?.map((e) => e as String)?.toList()
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..advertRead = json['advertRead'] as bool
    ..cat = json['cat'] as String
    ..donate = json['donate'] as bool
    ..copyright = json['copyright'] as String
    ..isForbidForFreeApp = json['isForbidForFreeApp'] as bool
    ..isAllowNetSearch = json['isAllowNetSearch'] as bool
    ..limit = json['limit'] as bool
    ..copyrightInfo = json['copyrightInfo'] as String
    ..copyrightDesc = json['copyrightDesc'] as String
    ..discount = json['discount'] as String;
}

Map<String, dynamic> _$BookDetailToJson(BookDetail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'longIntro': instance.longIntro,
      'majorCateV2': instance.majorCateV2,
      'author': instance.author,
      'minorCateV2': instance.minorCateV2,
      'majorCate': instance.majorCate,
      'minorCate': instance.minorCate,
      'title': instance.title,
      'cover': instance.cover,
      'creater': instance.creater,
      'starRatingCount': instance.starRatingCount,
      'starRatings': instance.starRatings,
      'isMakeMoneyLimit': instance.isMakeMoneyLimit,
      'contentLevel': instance.contentLevel,
      'isFineBook': instance.isFineBook,
      'safelevel': instance.safelevel,
      'allowFree': instance.allowFree,
      'originalAuthor': instance.originalAuthor,
      'authorDesc': instance.authorDesc,
      'rating': instance.rating,
      'hasCopyright': instance.hasCopyright,
      'buytype': instance.buytype,
      'sizetype': instance.sizetype,
      'superscript': instance.superscript,
      'currency': instance.currency,
      'contentType': instance.contentType,
      'allowMonthly': instance.allowMonthly,
      'allowVoucher': instance.allowVoucher,
      'allowBeanVoucher': instance.allowBeanVoucher,
      'hasCp': instance.hasCp,
      'banned': instance.banned,
      'postCount': instance.postCount,
      'totalFollower': instance.totalFollower,
      'latelyFollower': instance.latelyFollower,
      'followerCount': instance.followerCount,
      'wordCount': instance.wordCount,
      'serializeWordCount': instance.serializeWordCount,
      'retentionRatio': instance.retentionRatio,
      'updated': instance.updated,
      'isSerial': instance.isSerial,
      'chaptersCount': instance.chaptersCount,
      'lastChapter': instance.lastChapter,
      'gender': instance.gender,
      'tags': instance.tags,
      'advertRead': instance.advertRead,
      'cat': instance.cat,
      'donate': instance.donate,
      'copyright': instance.copyright,
      'isForbidForFreeApp': instance.isForbidForFreeApp,
      'isAllowNetSearch': instance.isAllowNetSearch,
      'limit': instance.limit,
      'copyrightInfo': instance.copyrightInfo,
      'copyrightDesc': instance.copyrightDesc,
      'discount': instance.discount
    };
