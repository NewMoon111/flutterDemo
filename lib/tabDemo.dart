
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
          title: const Text("paegView的应用") ,
        ),
        body: const Text("11111") ,
      ) ,
    );
  }
}


