import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_dynamic_appbar.dart';
/*
* 本片介绍的是 滑动改变appbar 而且刷新的时候不影响主页面
* */

class QuDynamicAppbarExample extends StatelessWidget {
  static List imgList = [
    'lib/images/wuming_vertical1.jpg',
    'lib/images/wuming_vertical2.jpg',
    'lib/images/wuming_vertical3.jpg',
    'lib/images/wuming_vertical4.jpg',
    'lib/images/wuming_vertical5.jpg',
    'lib/images/wuming_vertical6.jpg',
    'lib/images/wuming_vertical7.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuDynamicAppbar(
      backgroundColor: QuColors.white,
      title: 'QuDynamicAppbarExample',
      bodyWidget: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(14*X),
              width: double.maxFinite,
              child: Image.asset(imgList[index],fit: BoxFit.fitHeight,),
            );
          }),
    );
  }
}
