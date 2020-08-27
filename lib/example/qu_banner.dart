import 'package:flutter/material.dart';
import 'package:flutterqukit/src/qu_banner.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';
import '../src/qu_scaffold.dart';

/*
本篇用到的插件 flutter_swiper: ^1.1.6 和 photo_view: ^0.9.2
* */
class QuBannerExample extends StatelessWidget {
  final List imgList = [
    'lib/images/wuming_cross1.png',
    'lib/images/wuming_cross2.png',
    'lib/images/wuming_cross3.png',
    'lib/images/wuming_cross4.png',
  ];
  @override
  Widget build(BuildContext context) {
    double X  = QuScreen.X(context);
   return QuScaffold(
     title:'QuBanner',
     body: Column(
     children: <Widget>[
       SizedBox(
         width: double.maxFinite,
         height: 10*X,
       ),
       QuBanner(
         imgList: imgList,
         bannerHeight: 198*X,
         bannerWidth: double.maxFinite,
         shadowColor: QuColors.backgroundColor,
       ),
       SizedBox(
         width: double.maxFinite,
         height: 10*X,
       ),
       QuBanner(
         imgList: imgList,
         bannerHeight: 198*X,
         bannerWidth: double.maxFinite,
         shadowColor: QuColors.backgroundColor,
         isShowThreeImg: true,
       ),
       SizedBox(
         width: double.maxFinite,
         height: 10*X,
       ),
       QuBanner(
         imgList: imgList,
         bannerHeight: 198*X,
         bannerWidth: double.maxFinite,
         shadowColor: QuColors.theme,
         isShowThreeImg: true,
         bannerRadius: 5,
       ),
     ],
   ),
   );
  }
}



