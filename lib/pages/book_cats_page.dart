import 'package:flutter/material.dart';
import 'package:flutter_zhuishushenqi/models/BookCategories.dart';
import 'package:flutter_zhuishushenqi/models/BookCategoryDetails.dart';
import 'package:flutter_zhuishushenqi/net/Request.dart';
import 'package:flutter_zhuishushenqi/utils/utils.dart';
import 'package:flutter_zhuishushenqi/widgets/item_book_category.dart';
import 'package:flutter_zhuishushenqi/widgets/left_menu.dart';
import 'package:flutter_zhuishushenqi/widgets/text_center_in_line.dart';


/// 书籍分类页面
class BookCatsPage extends StatefulWidget {
  @override
  _BookCatsPageState createState() => _BookCatsPageState();
}

class _BookCatsPageState extends State<BookCatsPage> {

  ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  List<String> leftMenuTitles = ['男生', '女生', '出版'];
  List<double> scrollPositionList = [];

  @override
  void initState() {
    _scrollController.addListener((){
      if(scrollPositionList.isNotEmpty){
        var offset = _scrollController.offset;
        if(offset<0 || (offset>=scrollPositionList[0]&&offset<scrollPositionList[1])){
          leftMenuStateKey.currentState.selectOne(0);
        } else if(offset>=scrollPositionList[1]&&offset<scrollPositionList[2]){
          leftMenuStateKey.currentState.selectOne(1);
        }else{
          leftMenuStateKey.currentState.selectOne(2);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('书籍分类'),
      ),
      body: FutureBuilder(
          future: getBookCats(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            BookCategories bookCategories = snap.data as BookCategories;
            if (!bookCategories.ok) {
              showToast('请稍后再试');
              return RaisedButton(
                onPressed: (){
                  setState(() {

                  });
                },
                child: Text('点击重试'),
              );
            } else {
              calculateCatsHeight(bookCategories);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: LeftMenu(key:leftMenuStateKey,children:leftMenuTitles, defaultChoosenIndex:selectedIndex, listener:(index) {
                        selectedIndex = index;
                        doScrollAction(selectedIndex);
                        print('position pixels == ${_scrollController.offset}');
                      },margin: EdgeInsets.only(top: 20))),
                  Expanded(
                    flex: 8,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomScrollView(slivers: <Widget>[
                          TextCenterInLine(text: '男生'),
                          SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 2,
                              ),
                              delegate: SliverChildBuilderDelegate((context, index) {
                                BookCategoryDetails bookCategoryDetails =
                                bookCategories.male[index];
                                return ItemBookCategory(
                                    categoryName: bookCategoryDetails.name,
                                    bookCount: bookCategoryDetails.bookCount,
                                    imageSrc: bookCategoryDetails.bookCover);
                              }, childCount: bookCategories.male.length)),
                          TextCenterInLine(text: '女生'),
                          SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 2,
                              ),
                              delegate: SliverChildBuilderDelegate((context, index) {
                                BookCategoryDetails bookCategoryDetails =
                                bookCategories.female[index];
                                return ItemBookCategory(
                                    categoryName: bookCategoryDetails.name,
                                    bookCount: bookCategoryDetails.bookCount,
                                    imageSrc: bookCategoryDetails.bookCover);
                              }, childCount: bookCategories.female.length)),
                          TextCenterInLine(text: '出版'),
                          SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 2,
                              ),
                              delegate: SliverChildBuilderDelegate((context, index) {
                                BookCategoryDetails bookCategoryDetails =
                                bookCategories.press[index];
                                return ItemBookCategory(
                                    categoryName: bookCategoryDetails.name,
                                    bookCount: bookCategoryDetails.bookCount,
                                    imageSrc: bookCategoryDetails.bookCover);
                              }, childCount: bookCategories.press.length)),
                        SliverPersistentHeader(
                            delegate: CustomSliverPersistentHeaderDelegate(
                                max: 500,
                                min: 500,
                                child: Container(
                                  child: Text(''),
                                )))
                        ], controller: _scrollController)
                    ),
                  )
                ],
              );
            }
          }),
    );
  }


  doScrollAction(int index){
    if(_scrollController.position!=null){
        _scrollController.position.animateTo(scrollPositionList[index], duration: Duration(milliseconds: 500),
            curve: Curves.ease);
    }
  }

  ///计算一个分类列表的高度
  calculateOneCatHeight(List<int> lengthList,int type){
    var itemHeight = (MediaQuery.of(context).size.width * 0.8 - 30)/4;
    print('itemHeight==$itemHeight');
    var headHeight = 30 * type;
    var sum = 0.0;
    sum += headHeight;
    for(var item in lengthList){

      var rowsCount = item ~/2 + item % 2;
      sum += itemHeight * rowsCount + 10 * (rowsCount -1);
    }
    return sum;
  }

  calculateCatsHeight(BookCategories bookCategories){
    scrollPositionList.add(calculateOneCatHeight([], 0));
    scrollPositionList.add(calculateOneCatHeight([bookCategories.male.length], 1));
    scrollPositionList.add(calculateOneCatHeight([bookCategories.male.length,bookCategories.female.length], 2));
  }

}
