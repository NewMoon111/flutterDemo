


import 'package:flutter/material.dart';

void main() => runApp(const Myapp());


class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "这是StateFulState的基础认知",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Home() ,
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int number = 0;

  void add() {
    // ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    // 打开抽屉.
    // state.openDrawer();
    setState(() {
      number ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "这个是导航",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black38,
            decoration: TextDecoration.none
          ),
        ),
      ),
      body: Center(
        child: Text(
          "每次点击都会新增$number"
        ),
      ),
      floatingActionButton: FloatingActionButton(
       onPressed: add,
       tooltip: "hi",
        child: const Icon(Icons.add),
      ) ,
    );
  }
}


