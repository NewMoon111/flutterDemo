import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pageView的应用",
      home: Scaffold(
        appBar: AppBar(
          title: Text("paegView的应用") ,
        ),
        body: PageViewSection() ,
      ) ,
    );
  }
}

class PageViewSection extends StatelessWidget {
  const PageViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add( Page( text: '$i'));
    }

    return PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: children,
    );
  }
}


// Tab 的页面.
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}
