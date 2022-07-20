

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      title: "hello world",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("布局测试"),
        ),
        body: Column(
          children: const [
            Text("按钮测试"),
            // RaisedButton(onPressed: onPressed),
            // RichText(text: "hi")
            TextButton(
                onPressed: null,
                child: Text("hi"),
            ),
            // ConBox()
            SizedBox()
          ],
        ) ,
      ) ,
    );
  }
}

class ConBox extends StatelessWidget {
  const ConBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 100,
        minWidth: 100,
        maxWidth: 200,
        maxHeight: 100
    ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
          child: Text("hi,我在一个容器里面")
      ),

    );
  }
}
