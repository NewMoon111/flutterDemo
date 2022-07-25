
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "自定义滚动视图",
      home: Scaffold(
        appBar: AppBar(
          title: Text("自定义滚动视图") ,
        ) ,
        body: Demo01() ,
      ) ,
    );
  }
}

Widget buildTwoSliverList() {
  // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
  // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
  // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
  var listView = SliverFixedExtentList(
    itemExtent: 56, //列表项高度固定
    delegate: SliverChildBuilderDelegate(
          (_, index) => ListTile(title: Text('$index')),
      childCount: 10,
    ),
  );
  // 使用
  return CustomScrollView(
    slivers: [
      listView,
      listView,
    ],
  );
}

class Demo02 extends StatelessWidget {
  const Demo02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildTwoSliverList() ;
  }
}


class Demo01 extends StatelessWidget {
  const Demo01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 100,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: 40,
            itemCount: 30,
            itemBuilder: (BuildContext innerContext,int innerIndex) {
              return Text("当前的值是$innerIndex");
          },
          );
        }
        else{
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 40,
              itemCount: 30,
              itemBuilder: (BuildContext innerContext,int innerIndex) {
            return Text(
                "第二个滚动视图的当前的值是$innerIndex",
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20
              ) ,
            );
          });
        }
      } ,
    );
  }
}
