import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: "容器的布局",
       home: Scaffold(
         appBar: AppBar(
           title: const Text("容器类的布局实例"),
         ),
        body: Center(
          child: Container(
            color: Colors.red,
            width: 300,
            height: 200,
            child: FittedBox(
              fit: BoxFit.contain,
              // alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ) ,
          ),
        ) ,
       ) ,
    );
  }
}

class TestB extends StatelessWidget {
  const TestB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      /**
       * 这种怎么理解.其实打开可视化看一眼就清楚了.
       * 添加的padding 是跟前端一样算为sizeBox的间距的.
       * 如果改为单个的padding. 要注意为啥没有颜色.
       * 颜色是由谁来改的.
       */
      child: Container(
        color: Colors.blue,
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ) ,
    );
  }
}

class TestA extends StatelessWidget {
  const TestA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Container(
              color: Colors.blue,
              child: const SizedBox(
                width: 20,
                height: 20,
              ),
            ),
          ) ,
        ),
      ),
    );
  }
}
