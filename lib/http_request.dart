import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class Request{
  Future<CommonModel> fetchPost() async{
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
//    print(response.body);
    return CommonModel.fromJson(result);
  }

  _saveData() async{
    SharedPreferences ud = await SharedPreferences.getInstance();
//    setState(() {
//
//    }
//    });
    await ud.setString("key", "value");
  }

_getData() async {
  SharedPreferences ud = await SharedPreferences.getInstance();
  await ud.getString("key");
}


}





class CommonModel {
  final String title;
//  final List array;
//  final Map dic;
//  final bool boolean;
//  final int count;
  CommonModel({this.title});

//  CommonModel({this.title,this.array,this.dic,this.boolean,this.count,});
  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(
      title: json['title'],
//      array: json['array'],
//      dic: json['dic'],
//      boolean: json['boolean'],
//      count: json['count'],
    );
  }
}

