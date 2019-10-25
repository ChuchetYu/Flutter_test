import 'package:flutter/material.dart';
import 'package:flutter_test1/pages/film_page.dart';
import 'package:flutter_test1/pages/find_page.dart';
import 'package:flutter_test1/pages/home_page.dart';
import 'package:flutter_test1/pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _selectedColor = Color(0xFF4b64f5);
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          FilmPage(),
          FindPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: _defaultColor,),
            activeIcon: Icon(Icons.home,color: _selectedColor,),
            title: Text('首页',style: TextStyle(color: _currentIndex == 0 ? _selectedColor : _defaultColor,fontSize: 12),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hot_tub,color: _defaultColor,),
              activeIcon: Icon(Icons.hot_tub,color: _selectedColor,),
              title: Text('免影宝',style: TextStyle(color: _currentIndex == 1 ? _selectedColor : _defaultColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page,color: _defaultColor,),
              activeIcon: Icon(Icons.find_in_page,color: _selectedColor,),
              title: Text('发现',style: TextStyle(color: _currentIndex == 2 ? _selectedColor : _defaultColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_location,color: _defaultColor,),
              activeIcon: Icon(Icons.my_location,color: _selectedColor,),
              title: Text('我的',style: TextStyle(color: _currentIndex == 3 ? _selectedColor : _defaultColor),)
          )
        ],
      ),
    );
  }
}
