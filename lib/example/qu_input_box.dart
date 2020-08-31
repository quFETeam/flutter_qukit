import 'package:flutter/material.dart';
import '../src/qu_input_box.dart';
import '../util/qu_screen.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_gaussian_blur.dart';
/*
* 本页介绍的是文本输入框的封装，缺点 容错率比较低，每个app的输入框样式变化较大，
* 可以通过源码自定义自己的输入框，本页供参考思路
* */

class QuInputBoxExample extends StatefulWidget {
  @override
  _QuInputBoxExampleState createState() => _QuInputBoxExampleState();
}

class _QuInputBoxExampleState extends State<QuInputBoxExample> {
  TextEditingController _quMoreLinesInput = new TextEditingController();
  TextEditingController _quOneLineInput = new TextEditingController();
  TextEditingController _leftTextInput = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onVerticalDragEnd: (_) {
        //左右和上下滑动 收回键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: QuScaffold(
        title: 'QuInputBoxExample',
        body: QuCoverBlur(
          doubleRadius: 1,
          imgW: double.maxFinite,
          imgH: double.maxFinite,
          topWidget: Column(
            children: <Widget>[
              SizedBox(
                width: double.maxFinite,
                height: 30 * X,
              ),
              QuMoreLinesInput(
                horizontal: 16 * X,
                textEditingController: _quMoreLinesInput,
                function: () {
                  print(_quMoreLinesInput.text.length);
                },
              ),
              SizedBox(
                width: double.maxFinite,
                height: 30 * X,
              ),
              OneLineInput(
                horizontal: 16 * X,
                textEditingController: _quOneLineInput,
                function: () {
                  print(_quOneLineInput.text.length);
                },
              ),
              SizedBox(
                width: double.maxFinite,
                height: 30 * X,
              ),
              LeftTextInput(
                textEditingController: _leftTextInput,
                leftText: '姓名:',
                hitText: '请输入真实姓名',
                function: () {
                  print(_leftTextInput.text.length);
                },
              ),
            ],
          ),
          image: AssetImage('lib/images/wuming_vertical6.jpg'),
        ),
      ),
    );
  }
}
