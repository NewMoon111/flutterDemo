import 'dart:ffi';

import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
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

class helloWidget extends StatelessWidget {
  const helloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// 动物，这里的name很有意思. 声明可选的是一种解决办法.
class Animals {
  String?  _name;
  Int     age;
  Animals(this.age);
}


class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// 下划线带着的是私有的.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

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
                    '这个是控制啥的'
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