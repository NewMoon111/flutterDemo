

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(HelloWorld());


class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class ChannelDemo extends MethodChannel{
  ChannelDemo(String name) : super(name);



}
