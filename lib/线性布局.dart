import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "线性布局",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("线性布局"),
        ),
        body: Wrap(
          direction: Axis.vertical,

          children: [
            const Text("hello"),
            const TextButton(
                onPressed: null,
                child: Text("hi, 希望我赚很多很多的钱")
            ),
          //通过ConstrainedBox来确保Stack占满屏幕
            const ViewBox(),


            SizedBox(
              width: 200,
              height: 200,
              child: Container(
                color: Colors.yellow,
                child: Align(
                  alignment: const FractionalOffset(0.2, 0.6),
                  child: Container(
                    width: 110,
                    height: 30,
                    color: Colors.blue,
                    child: const Text("111111"),
                  ),
                ),
              ) ,
            )

        ],
      ) ,
      ) ,
    );
  }
}


///  如果说我这里换行，是不是还有
///  提示呢？ 这种是最好不需要使用
class ResponsiveColumn extends StatelessWidget {

  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    /**
     * LayoutBuilder 返回的是也是widget。所以可以用在build里面.
     */
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(children: children, mainAxisSize: MainAxisSize.min);
        } else {
          // 大于200，显示双列
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(children: _children, mainAxisSize: MainAxisSize.min);
        }
      },
    );
  }
}


class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
        ResponsiveColumn(children: _children),
        // LayoutLogPrint(child:Text("xx")) // 下面介绍
      ],
    );
  }
}

class ViewBox extends StatelessWidget {
  const ViewBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(200, 200)),
      child: Container(
        color: Colors.blue,
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, // 指的也是未定位的元素.
          children: <Widget>[
            // 因为只有这个不是Positoned. 所以
            Container(
              child: const Text(
                  "Hello world",
                  style: TextStyle(color: Colors.white)
              ),
              color: Colors.red, // 这个是背景色.
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
