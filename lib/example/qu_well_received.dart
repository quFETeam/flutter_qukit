import 'package:flutter/material.dart';
import 'package:flutterqukit/constants/qu_colors.dart';
import '../src/qu_starts_score.dart';
import '../util/qu_screen.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_gaussian_blur.dart';

class QuWellReceived extends StatefulWidget {
  @override
  _QuWellReceivedState createState() => _QuWellReceivedState();
}

class _QuWellReceivedState extends State<QuWellReceived> {
  String ratingValue = '9';

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        title: '好评一下',
        body: Column(
          children: <Widget>[
            SizedBox(
              width: double.maxFinite,
              height: 150*X,
            ),
            QuCoverBlur(
              sigma: double.parse(ratingValue),
              image: AssetImage(
                'lib/images/wuming_cross2.png',
              ),
              imgH: 180 * X,
              imgW: 365 * X,
              topWidget: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 80*X),
                  child: RatingBar(
                    value: 9, //初始几分
                    size: 30, //星星的大小
                    padding: 10, //星星的边距
                    nomalImage: 'lib/images/star_nomal.png', //未选中的星星
                    selectImage: 'lib/images/star.png', //选中的星星
                    selectAble: true, //禁用
                    onRatingUpdate: (value) {
                      setState(() {
                        ratingValue = value; //多少分
                      });
                    },
                    maxRating: 10, //最大分数
                    count: 5, //星星的数量
                  ),),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50*X,
            ),
            Text('分数$ratingValue',style: TextStyle(
                fontSize: 24*X,
                color: QuColors.fontLightColor
            ),),
          ],
        ),
    );
  }
}
