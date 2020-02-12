import 'package:json_annotation/json_annotation.dart';
import 'StarRating.dart';
part 'BookDetail.g.dart';

@JsonSerializable()
class BookDetail {
    BookDetail();

    @JsonKey(name:'_id') String id;
    String longIntro;
    String majorCateV2;
    String author;
    String minorCateV2;
    String majorCate;
    String minorCate;
    String title;
    String cover;
    String creater;
    num starRatingCount;
    List<StarRating> starRatings;
    bool isMakeMoneyLimit;
    num contentLevel;
    bool isFineBook;
    num safelevel;
    bool allowFree;
    String originalAuthor;
    String authorDesc;
    StarRating rating;
    bool hasCopyright;
    num buytype;
    num sizetype;
    String superscript;
    num currency;
    String contentType;
    bool allowMonthly;
    bool allowVoucher;
    bool allowBeanVoucher;
    bool hasCp;
    num banned;
    num postCount;
    num totalFollower;
    num latelyFollower;
    num followerCount;
    num wordCount;
    num serializeWordCount;
    String retentionRatio;
    String updated;
    bool isSerial;
    num chaptersCount;
    String lastChapter;
    List<String> gender;
    List<String> tags;
    bool advertRead;
    String cat;
    bool donate;
    String copyright;
    bool isForbidForFreeApp;
    bool isAllowNetSearch;
    bool limit;
    String copyrightInfo;
    String copyrightDesc;
    String discount;

    factory BookDetail.fromJson(Map<String,dynamic> json) => _$BookDetailFromJson(json);
    Map<String, dynamic> toJson() => _$BookDetailToJson(this);
}
