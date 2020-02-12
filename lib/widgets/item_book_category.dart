import 'package:flutter/material.dart';
import 'package:flutter_novel/config/service_url.dart';

class ItemBookCategory extends StatefulWidget {
  String categoryName;
  var imageSrc = [];

  int bookCount;

  ItemBookCategory({Key key, this.categoryName, this.bookCount, this.imageSrc});

  @override
  _ItemBookCategoryState createState() =>
      _ItemBookCategoryState(categoryName, bookCount, imageSrc);
}

class _ItemBookCategoryState extends State<ItemBookCategory> {
  var imageSrc = [];

  String categoryName;

  int bookCount;

  _ItemBookCategoryState(this.categoryName, this.bookCount, this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350], borderRadius: BorderRadius.circular(3)
      ),
      child: Row(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        child: Text(categoryName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                        padding: EdgeInsets.only(left: 10)),
                    Text(bookCount.toString() + '本')
                  ],
                )),
            Expanded(
                flex: 4,
                child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 10,right: 30),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.network(imageBaseUrl + imageSrc[0]))),
                        Container(
                            margin: EdgeInsets.only(top: 20,left: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.network(imageBaseUrl + imageSrc[1]))),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.network(imageBaseUrl + imageSrc[2]))),
                      ],
                    ))
            )
          ],
      ),
    );
  }
}
