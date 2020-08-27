import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_button.dart';
import '../src/qu_scaffold.dart';

/*
  按钮demo
* */
class Button extends StatelessWidget {
  void _onTap() {
    print('点击按钮');
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        title: 'QuButton',
        backgroundColor: QuColors.backgroundColor,
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
              QuButton(
                //inline Button
                  borderRadius: 1.5,
                  letterSpacing:0.5,
                  borderColor: Color(0xFFD8D8D8),
                  borderWidth: 0.5,
                  primaryColor: Colors.white,
                  textColor: QuColors.fontPrimaryColor,
                  onTap: _onTap),
              SizedBox(
                height: 10 * X,
              ),
              QuButton(
                //inline Button
                  borderRadius: 1.5,
                  active: true,
                  letterSpacing:0.5,
                  activeTextColor: Color(0xFFBB3A24),
                  activeColor: Colors.white,
                  borderColor: Color(0xFFD8D8D8),
                  activeBorderColor: Color(0xFFBB3A24),
                  borderWidth: 0.5,
                  primaryColor: Colors.white,
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
        )
    );
  }
}
