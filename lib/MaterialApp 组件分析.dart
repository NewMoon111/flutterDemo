

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hi,这个是我第一次用MaterialApp的组件",
        theme: ThemeData(
           primaryColor: Colors.yellow,
        ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("这个是导航条吧"),
          ),
          body: const AppCenter()
      ),
    );
  }
}

class AppCenter extends StatelessWidget {
  const AppCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "hi，谁还没有个第一次",
        style: TextStyle(
          fontSize: 18,
          color: Colors.red,
          // 通过这个来消除
          decoration: TextDecoration.none
        ),
      ),
    );
  }
}
