import 'package:flutter/material.dart';
import '../src/qu_starts_score.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_appbar.dart';

class QuWellReceived extends StatefulWidget {
  @override
  _QuWellReceivedState createState() => _QuWellReceivedState();
}

class _QuWellReceivedState extends State<QuWellReceived> {

  String ratingValue = '';
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      appBar: PreferredSize(
          child: QuAppBar(
            title: '好评一下',
      ), preferredSize: Size.fromHeight(44)),
      backgroundColor: QuColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 85*X),
        alignment: Alignment.center,
        child: RatingBar(
          value: 9,//初始几分
          size: 30,//星星的大小
          padding: 10,//星星的边距
          nomalImage: 'lib/images/star_nomal.png',//未选中的星星
          selectImage: 'lib/images/star.png',//选中的星星
          selectAble: true,//禁用
          onRatingUpdate: (value) {
            setState(() {
              ratingValue = value;//多少分
            });
          },
          maxRating: 10,//最大分数
          count: 5,//星星的数量
        ),
      )
    );
  }
}
