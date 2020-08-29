import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_flexible_text.dart';

class QuFlexibleTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        backgroundColor: QuColors.backgroundColor,
        title: 'QuFlexibleTextExample',
        body: ListView(
          padding: EdgeInsets.only(top:20*X),
          children: <Widget>[
            QuFlexibleText(
                text:'宁姑娘，最近还好吗？宁姑娘，我这趟出门，见识多很多有趣的事情，说给你听吧？ '
                     '宁姑娘，你一定想不到吧，我当初答应你练拳一百万遍，现在只差两万拳了。  '
                     '宁姑娘，你知不知道，当时在泥瓶巷祖宅，你笑的时候，我就会觉得自己是天底下最有钱的人。'
                     '宁姑娘，你以前问我喜不喜欢你，我说没有，你好像没有不开心，可是如今我有这么喜欢你了，你好像不太开心，对不起。',
                iconUpAssets: 'lib/images/text_up.png',
                iconDownAssets: 'lib/images/text_down.png',),
            SizedBox(
              width: double.maxFinite,height: 100*X,
            ),
            QuFlexibleText(
                text:'宁姑娘，最近还好吗？宁姑娘，我这趟出门，见识多很多有趣的事情，说给你听吧？ '
                    '宁姑娘，你一定想不到吧，我当初答应你练拳一百万遍，现在只差两万拳了。  '
                    '宁姑娘，你知不知道，当时在泥瓶巷祖宅，你笑的时候，我就会觉得自己是天底下最有钱的人。'
                    '宁姑娘，你以前问我喜不喜欢你，我说没有，你好像没有不开心，可是如今我有这么喜欢你了，你好像不太开心，对不起。',
                containerWith: 330*X,
                containerCircular: 15,
                paddingVertical: 20*X,
                paddingHorizontal: 10*X,
                textSize: 14*X,
                textColor: QuColors.white,
                iconWith: 40*X,
                iconHeight: 16*X,
                iconBottom:21*X,
                iconRight: 7.5*X,
                iconUpAssets: 'lib/images/text_up.png',
                iconDownAssets: 'lib/images/text_down.png',
                inkwellSize: 42*X,
                inkwellBottom: 10*X,
                sSTextMaxLines:3,
                backgroundColor: QuColors.theme),
          ],
        )
    );
  }
}

