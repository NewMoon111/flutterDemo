import 'dart:ffi';

import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  // 构造函数的一种.key值是一个可选的参数.
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '这个是标题.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '这个是一个homePage。'),
    );
  }
}

// 这里有个问题是为什么title不是放在state里面.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// 私有的类
class _MyHomePageState extends State<MyHomePage> {

  /*
  * 如果有这种非final的变量就只能放在state里面，
  * 但是如果我们想获得ful里面的final变量的话，我们可以通过widget来获取
  * 通过widgetful里面的变量在更换widget的时候都会更换.
  * */
  int _counter = 0;

  // 这个是一个私有的方法. 这个类里面的私有方法.
  // 至于这个set
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

   /* 这里都是配置文件.
   * 本质上其实是三棵树的更新逻辑. 我们在更新widget的时候，element树上不会直接更新.而是优先复用
   * 复用逻辑很比较的是canUpdate,canUpdate内部比较的是widget的类型和key.
   * 其实，我们的原则是应该避免element的重建，优先复用.
   * */

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 100,
                  minHeight: 100,
                  maxHeight: 200,
                  maxWidth: 200
              ),
              child: Container(
                color: Colors.green,
                child: const Text(
                    'hello 你说文字的这些东西需要我们重新设置值吗1111'
                ),
              ),
            ),
            Container(
              color: Colors.amber,
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Text(
                    '这个是控制啥的1232131312313'
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}