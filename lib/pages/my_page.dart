import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

List<String> cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class _MyPageState extends State<MyPage> {
//  final PageController _controller = PageController(
//    initialPage: 0,
//  );
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
          _footerRefresh();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: RefreshIndicator(
          onRefresh: _headerRefresh,
          child: ListView(
            children: _buildList(),
            controller: _scrollController,
          ),
        ),
      ),
    );
  }

  Future<Null> _headerRefresh() async {
    await Future.delayed(Duration(microseconds: 200));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  _footerRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String>list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
    return null;
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
