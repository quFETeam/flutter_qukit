import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_dynamic_appbar.dart';
/*
* 本片介绍的是 滑动改变appbar 而且刷新的时候不影响主页面
* */

class QuDynamicAppbarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuDynamicAppbar(
      backgroundColor: QuColors.white,
      title: 'QuDynamicAppbarExample',
      bodyWidget: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              height: 50*X,
              margin: EdgeInsets.all(14*X),
              width: double.maxFinite,
              child:Text('重点是顶部的导航bar！'),
            );
          }),
    );
  }
}
