import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';

class QuMoreLinesInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function function;
  final String hintText;
  final int maxWord;
  final double horizontal;
  final double height;
  QuMoreLinesInput({
    Key key,
    @required this.textEditingController,
    @required this.function,
    this.hintText='请留下您的珍贵意见，意见如有意义，我们会奖励平台会员哦！',
    this.maxWord = 200,
    this.horizontal = 16,
    this.height = 162.5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: QuColors.divider,
              width: 1
          )
      ),
      margin: EdgeInsets.symmetric(horizontal: horizontal),
      padding: EdgeInsets.fromLTRB(10 * X, 0, 8 * X, 0),
      height: height,
      child: InputBox(
        textColor: QuColors.white,
        textInputType: TextInputType.text,
        hintText:hintText,
        maxLine: null,
        textEditingController: textEditingController,
        textMaxLength: maxWord,
        function:function,
        textInputFormatter: BlacklistingTextInputFormatter(RegExp("[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDE4F]")),
      ),
    );
  }
}

class OneLineInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function function;
  final String hintText;
  final int maxWord;
  final double horizontal;
  final double height;
  final Color textColor;
  OneLineInput({
    Key key,
    @required this.textEditingController,
    @required  this.function,
    this.hintText='请输入您的联系方式。',
    this.maxWord=32,
    this.horizontal=15,
    this.height=44,
    this.textColor = Colors.white
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: QuColors.divider,
                  width: 1
              )
          ),
          margin: EdgeInsets.symmetric(horizontal:horizontal),
          padding: EdgeInsets.fromLTRB(14 * X, 0, 14 * X, 10),
          height: height,
        ),
        Positioned(
          left: 22.5*X,bottom: -3*X,
          child:InputBox(
            function:function ,
            textColor: textColor,
            textInputType: TextInputType.text,
            hintText: hintText,
            maxLine: 1,
            textEditingController: textEditingController,
            textMaxLength: maxWord,
            textInputFormatter: WhitelistingTextInputFormatter(
                RegExp("[a-zA-Z]|[@]|[0-9]|[.]")),
          ),)
      ],
    );
  }
}

class LeftTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String leftText;
  final String hitText;
  final Function function;
  final Color leftTextColor;
  LeftTextInput({Key key,
    @required this.textEditingController,
    @required this.leftText,
    @required this.hitText,
    @required this.function,
    this.leftTextColor=Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Container(
        padding: EdgeInsets.only(left: 40.5 * X, right: 40.5 * X),
        width: 375 * X,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(leftText,
              style: TextStyle(color: leftTextColor, fontSize: 17 * X),
            ),
            SizedBox(width: 5 * X),
            Container(
              width: 243.5 * X,
              height: 37 * X,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1 * X, color: Color(0xFFF3F3F3))),
              ),
              child: InputBox(
                textInputType: TextInputType.text,
                textEditingController:textEditingController,
                maxLine: 1,
                hintText: hitText,
                textInputFormatter: BlacklistingTextInputFormatter(RegExp("[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDE4F]")),
                textMaxLength: 20,
                function:function,
                inputBoxWidth: 243,
              ),
            ),
          ],
        ));
  }
}



class InputBox extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputFormatter textInputFormatter;
  final Function function;
  final int textMaxLength;
  final double leftPadding;
  final double inputBoxWidth;
  final Color textColor;
  InputBox({Key key,
    this.hintText,
    this.textEditingController,
    this.textInputType,
    this.function,
    this.textInputFormatter,
    this.textMaxLength,
    this.leftPadding=0.0,
    this.maxLine,
    this.inputBoxWidth=343,
    this.textColor =Colors.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Container(
      width: inputBoxWidth*X,
      child: TextField(
        style: TextStyle(fontSize: 14 * X, color:textColor),
        keyboardAppearance: Brightness.light,
        //输入文字样式
        controller: textEditingController,
        cursorColor: QuColors.theme,
        //指示器颜色
        cursorRadius: Radius.circular(5),
        //指示器圆角
        autofocus: false,
        //调到这个页面后 默认进行输入文本
        maxLines: maxLine,
        //为了让输入框 可以自动伸缩
        keyboardType: textInputType,
        //控制弹出的键盘是什么类型
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
              0,0,0,0
          ),
          //输入框里隐藏文字与输入框的距离
          border: InputBorder.none,
          //没有边框
          hintText: hintText,
          //输入框里面的提示文字，输入内容后消失。
          hintMaxLines: 2,
          hintStyle: TextStyle(
            fontSize: 13 * X,
            color: QuColors.fontLightColorX,
          ),
        ),
        inputFormatters: <TextInputFormatter>[
          // 白名单校验，也就是只允许输入符合规则的字符 字母汉字和数字
          textInputFormatter,
          LengthLimitingTextInputFormatter(textMaxLength)//限制长度,隐藏计数器
        ],
        onChanged: (value) {
          function();
        },
      ),
    );
  }
}

