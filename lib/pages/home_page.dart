import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  List _imgs = [
    'https://film.jyqnet.com/uploads/ad/20191017/20191017174956_678.jpg',
    'https://film.jyqnet.com/uploads/ad/20191018/20191018161508_435.jpg',
    'https://film.jyqnet.com/uploads/ad/20191011/20191011180609_137.jpg',
    'https://film.jyqnet.com/uploads/ad/20190930/20190930170848_139.png',
    'https://film.jyqnet.com/uploads/ad/20190531/20190531093138_417.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       /* appBar: AppBar(
          title: const Text('奕齐影视圈'),
          backgroundColor: Color(0xFF4B64F5),
        ),*/
          body: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 180,
                      child: Swiper(
                        itemCount: _imgs.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(
                            _imgs[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 1000,
                      child: ListTile(
                        title: Text('Caonima'),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 1,
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(color: Color(0xFF4B64F5)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text('奕齐影视圈'),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}