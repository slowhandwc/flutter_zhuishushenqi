import 'package:flutter/material.dart';
import 'package:flutter_novel/pages/book_find_page.dart';
import 'package:flutter_novel/pages/book_list_page.dart';
import 'package:flutter_novel/pages/book_market_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(title: Text('书架'),icon:Icon(Icons.library_books)),
    BottomNavigationBarItem(title:Text('书城'),icon: Icon(Icons.card_travel)),
    BottomNavigationBarItem(title:Text('发现'),icon: Icon(Icons.navigation))
  ];
  var tabPages = [BookListPage(),BookMarketPage(),BookFindPage()];
  var currentPage;
  int currentIndex = 0;
  @override
  void initState() {
    currentPage = tabPages[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabs,
        currentIndex: currentIndex,
        onTap: (index){
          currentIndex = index;
          setState(() {
            currentPage = tabPages[currentIndex];
          });
        }
      ),
    );
  }
}
