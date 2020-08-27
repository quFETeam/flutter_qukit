import 'package:flutter/material.dart';
import 'package:flutterqukit/constants/qu_colors.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_sand_able.dart';
import '../util/qu_screen.dart';

/*
* 本页介绍的是一个灭霸响指一样的沙化效果
* */

class QuSandAbleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
      title: 'QuSandAbleExample',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.maxFinite,
            height: 40 * X,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14 * X),
            child: QuSandAble(
              child: Image.asset(
                'lib/images/wuming_cross2.png',
                fit: BoxFit.cover,
                height: 200 * X,
                width: double.maxFinite,
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 60 * X,
          ),
          QuSandAble(
            duration: Duration(seconds: 5),
            numberOfLayers: 15,
            child: Container(
             color: QuColors.backgroundColor,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 300 * X,
                  height: 55 * X,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '这是一条消息',
                        style: TextStyle(fontSize: 12 * X),
                      ),
                      Text(
                        '消息的内容是：这是一条消息',
                        style: TextStyle(color: QuColors.fontLightColorX),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 70 * X,
                  height: 55 * X,
                  color: QuColors.red,
                  child: Center(
                    child: Text(
                      '删除',
                      style: TextStyle(color: QuColors.white, fontSize: 15 * X),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
