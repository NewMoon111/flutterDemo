import 'package:flutter/material.dart';
import 'package:yydsm/WidgetFulState%20%E5%9F%BA%E7%A1%80.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  // 基本上很多都是final的，按照这种
  final _scrollDelegate = ScrollController();
  var strs = ["hahaha","233","12dfdskfjsdaklfjslkafjlksafjsafjlsaf"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollDelegate.addListener(() {
        print("偏移量是" + _scrollDelegate.offset.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "滚动视图",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("滚动视图") ,
        ) ,
        body: Scrollbar(
          controller: _scrollDelegate,
          child: ListView.builder(
            itemExtent: 400,
              itemCount: strs.length,
              controller: _scrollDelegate,
              itemBuilder: (context,index) {
                return Text(strs[index]);
              }
          ),
        )
      ) ,
    );
  }
}

class TestB extends StatelessWidget {
  const TestB({
    Key? key,
    required ScrollController scrollDelegate,
    required this.strs,
  }) : _scrollDelegate = scrollDelegate, super(key: key);

  final ScrollController _scrollDelegate;
  final List<String> strs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("11111"),
        Expanded(
          child: ListView.builder(
            prototypeItem: const Text("11111111"),
            controller: _scrollDelegate,
            itemCount: strs.length,
            /**
             * 其实这里已经在定义处声明了.使用的时候没有必要但是最好写类型.
             * 对于无线循环列表如果做? 在原生里面是直接设置.
             */
            itemBuilder: (BuildContext context, int index) {
              return Text(strs[index]);
            },
          ),
        ),
      ],
    );
  }
}
/// 静态的
class TestA extends StatelessWidget {
  const TestA({
    Key? key,
    required this.strs,
  }) : super(key: key);

  final List<String> strs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      prototypeItem: Container(
        color: Colors.blue,
        child: Text(strs[0]) ,
      ) ,
      children: [
          Text(strs[0]),
          Text(strs[1]),
          Text(strs[2]),
      ],
    );
  }
}