import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_button.dart';
import 'qy_appbar.dart';

/*
  按钮demo
* */
class Button extends StatelessWidget {
  _onTap() {
    print('点击按钮');
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      backgroundColor: QuColors.backgroundColor,
      appBar: PreferredSize(
          child: QYAppBar(
            title: 'QuButton',
          ),
          preferredSize: Size.fromHeight(44)),
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10 * X,
            ),
            QuButton(onTap: _onTap),
            SizedBox(
              height: 10 * X,
            ),
            QuButton(
              //修改主色
              onTap: _onTap,
              primaryColor: Color(0xFFBB3A24),
              text: '确认选择',
            ),
            SizedBox(
              height: 10 * X,
            ),
            QuButton(
                //修改主色及文字颜色
                onTap: _onTap,
                textColor: Color(0xFF666666),
                primaryColor: Color(0xFFEFF1F5)),
            SizedBox(
              height: 10 * X,
            ),
            QuButton(
                //设置选中状态
                onTap: _onTap,
                active: true,
                primaryColor: Color(0xFFBB3A24)),
            SizedBox(
              height: 10 * X,
            ),
            QuButton(
                //设置禁用状态
                onTap: _onTap,
                disabled: true,
                text: '禁止点击',
                primaryColor: Color(0xFFBB3A24)),
            SizedBox(
              height: 10 * X,
            ),
            QuButton(
                //设置圆角
                borderRadius: 15,
                onTap: _onTap),
            SizedBox(
              height: 10 * X,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              QuButton(
                  //设置宽
                  width: 100,
                  onTap: _onTap),
              QuButton(
                  //设置宽及圆角
                  width: 195,
                  borderRadius: 15,
                  onTap: _onTap),
            ])
          ],
        ),
      ),
    );
  }
}
