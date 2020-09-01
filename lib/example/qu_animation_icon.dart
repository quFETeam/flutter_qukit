import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';
import '../src/qu_animation_Icon.dart';
import '../src/qu_scaffold.dart';

/*
* 本页收集了一些 小的动画组件
* */

class QuAnimationIconExample extends StatefulWidget {
  @override
  _QuAnimationIconExampleState createState() => _QuAnimationIconExampleState();
}

class _QuAnimationIconExampleState extends State<QuAnimationIconExample> {
  bool _isPraise = false;

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
      backgroundColor: QuColors.black,
      title: 'QuAnimationIcon',
      body: ListView(
        children: <Widget>[
          SizedBox(width: double.maxFinite, height: 10 * X),
          _praiseWidget(X),
          _rotatingWidget(X),
        ],
      ),
    );
  }

  //点赞
  Widget _praiseWidget(X){
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: 60 * X,
      child: InkWell(
        onTap: () {
          setState(() {
            _isPraise ? _isPraise = false : _isPraise = true;
          });
        },
        child: _isPraise
            ? QuAnimationPraise(
          size: 44,
        )
            : Icon(
          Icons.favorite,
          size: 44,
          color: QuColors.white,
        ),
      ),
    );
  }

  //旋转
  Widget _rotatingWidget(X){
    return Container(
        width: double.maxFinite,
        height: 100 * X,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: QuColors.backgroundColor,
                  shape: BoxShape.circle
              ),
              width: 75*X,height: 75*X,
              child:  QuRotatingIcon(
                rotatingWidget: Icon(
                  Icons.music_note,
                  color: QuColors.fontLightColorX,
                  size: 40*X,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: QuColors.white,
              radius: 37.5*X,
              child:  QuRotatingIcon(
                rotatingWidget:CircleAvatar(
                  radius: 34.5*X,
                  backgroundImage: AssetImage('lib/images/wuming_head0.jpg'),
                ),
              ),
            ),
          ],
        )
    );
  }

}
