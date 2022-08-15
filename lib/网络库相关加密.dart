

import 'dart:collection';
import 'dart:convert';
// import 'dart:convert';
// import 'package:crypto/crypto.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:yydsm/main1.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Demo(),
    );
  }
}


class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    genToken({
      "hello":"这个是测试",
      "hello2":"这个是测试2",
      "apiname":"这个是测试3",
      "bilibi":"这个是测试4"
    });

  }

  final String _salt = "php!api@mobile#imooc";

  String genToken(Map<String,dynamic> params) {

    String result = SplayTreeMap.from(params)
        .entries
        .map<String>((e) => "${e.key}=${e.value}")
        .join("&");
    print("这个是测试 $result");

    //进行md5加密
    var md5 = _md5encode(result + _salt);
    var token = _md5encode(md5 + _salt);

    print("这个是测试 $token");
    return token;
  }


  String _md5encode(String data) {
    return md5.convert(utf8.encode(data)).toString();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

