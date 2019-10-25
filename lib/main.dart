import 'package:flutter/material.dart';
import 'package:flutter_test1/navigator/tab_navigator.dart';

void main()
{
  return runApp(MyApp());
}

/*class loginApp extends StatefulWidget {
  @override
  _loginAppState createState() => _loginAppState();
}

class _loginAppState extends State<loginApp> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration:Duration(seconds: 2));
    animation = Tween<double>(begin: 0,end: 3).animate(controller)
    ..addListener(( ){
      setState(() {
        animationValue = animation.value;
      });
    })
    ..addStatusListener((AnimationStatus state) {
      setState(() {
        animationStatus = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.reset();
              controller.forward();
            },
            child: Text('Start',textDirection:TextDirection.ltr),
          ),

    Text('State' + animationStatus.toString(),textDirection:TextDirection.ltr),
    Text('Value' + animationValue.toString(),textDirection:TextDirection.ltr),
    Container(
    height: animation.value,
    width: animation.value,
    child: FlutterLogo(colors: Colors.blue,),
    )
        ],
      ),

    );
  }
}

*/


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),

      home: TabNavigator(),

    );
  }
}

