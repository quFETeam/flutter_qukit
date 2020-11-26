import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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

  Widget _bannerItem(index,context){
    PageController pageController =PageController(initialPage:index);
    double X  = QuScreen.X(context);
    return InkWell(
        onTap: () {
          Navigator.of(context).push(new FadeRoute(
              page: PhotoViewDetail(
                images:imgList, //传入图片list
                index: index, //传入当前点击的图片的index
                heroTag: imgList[index], //传入当前点击的图片的hero tag （可选）
                pageController: pageController,
              )));
        },
        child:Container(
          width: 209/2*X,
          height: 257/2*X,
          margin: EdgeInsets.fromLTRB(4.5*X, 0, 4.5*X, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6*X),
            child:Image.asset(imgList[index], fit: BoxFit.cover),
          ),
        )
    );
  }

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
       Container(
         color: QuColors.blue,
         child: Container(
             padding: EdgeInsets.fromLTRB(4.5*X, 0, 4.5*X, 0),
             color: QuColors.yellow,
             width: 698/2*X, height:257/2*X,
             child: Swiper(
                 itemBuilder: (BuildContext context, int index) {
                   return  Container(
                     margin:EdgeInsets.only(bottom: 2*X,top: 2*X) ,
                     child: _bannerItem(index,context),
                   );
                 },
                 viewportFraction:0.33,//图片的宽
                 scale: 1.0,
                 itemCount: imgList.length,
//            control: new SwiperControl(),在两侧 会出现标记
                 autoplay: false, //自动播放
                 pagination: null
             )),
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



