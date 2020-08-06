import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../global/qy_colors.dart';
import '../util/qu_screen.dart';
import 'qy_appbar.dart';

/*
* 本篇记录的是flutter开发中"text"的一些属性和一些用法和富文本""的使用
* */
class QYText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    //这里介绍一个计算文本宽度的方法
    Size _getTextSize(String text, TextStyle style) {
      final TextPainter textPainter = TextPainter(
          text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
        ..layout(minWidth: 0, maxWidth: double.infinity);
      return textPainter.size;
    }
    Size sz = _getTextSize('呵呵',TextStyle(fontSize: 15));
    print(sz.width);
    return Scaffold(
      appBar: PreferredSize(
          child: QYAppBar(
            title: 'QYText',
          ),
          preferredSize: Size.fromHeight(44)),
      body: ListView(
        padding: EdgeInsets.only(top: 100*X),
          children: <Widget>[
           Text(
                '学习Text',
                textAlign: TextAlign.center,
                //文本对齐方式  居中
                textDirection: TextDirection.ltr,
                //文本方向
                softWrap: false,
                //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
                overflow: TextOverflow.ellipsis,
                //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
                textScaleFactor: 2.0,
                //字体显示的赔率
                maxLines: 10,
                //最大行数
                style: new TextStyle(
                  decorationColor:QYColors.black,
                  //线的颜色
                  decoration: TextDecoration.lineThrough,
                  //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                  decorationStyle: TextDecorationStyle.solid,
                  //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                  wordSpacing: 0.0,
                  //单词间隙(负值可以让单词更紧凑)
                  letterSpacing: 0.0,
                  //字母间隙(负值可以让字母更紧凑)
                  fontStyle: FontStyle.italic,
                  //文字样式，斜体和正常
                  fontSize: 12.0*X,
                  //字体大小
                  fontWeight: FontWeight.w600,
                  //字体粗细  粗体和正常
                  color: QYColors.black, //文字颜色
                ),
              ),
            SizedBox(
              height: 100*X,width:double.maxFinite,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16*X,
                  fontWeight: FontWeight.w600
                ),//相同的属性什么的 都在这里写
                children:<TextSpan>[
                  TextSpan(
                      text:'了解富文本',
                      style: TextStyle(color:QYColors.black,),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("Link Clicked.");
                      },
                  ),
                  TextSpan(
                      text: '了解富文本',
                      style: TextStyle(color:QYColors.theme,)
                  ),

                ],
              ),
            ),

          ]),
    );
  }
}
