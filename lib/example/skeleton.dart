import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_skeleton.dart';
import '../util/qu_screen.dart';
/*
本篇介绍的是 骨架屏使用，
* */
class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
      title: 'QuSkeleton',
      body: Column(
        children: <Widget>[
        SizedBox(
          height: 50*X,width: double.maxFinite,
        ),
        _skeletonExample(X),
        SizedBox(
          height: 50*X,width: double.maxFinite,
        ),
        _textSkeleton(X),
        SizedBox(
          height: 50*X,width: double.maxFinite,
        ),
        SampleSkeletonItem(),//有动画
        SizedBox(
          height: 50*X,width: double.maxFinite,
        ),
        SampleSkeletonItem(//无动画
            animation:false
        )
      ],
     ),
    );
  }

  Widget _skeletonExample(X){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        QuSkeleton(
          shape: BoxShape.circle,
          width: 50*X,
          height: 50*X,
        ),
        QuSkeleton(
          shape: BoxShape.circle,
          width: 50*X,
          height: 50*X,
          color: QuColors.theme,
          shimmerColor: QuColors.white,
        ),
        QuSkeleton(
          shape: BoxShape.rectangle,
          width: 50*X,
          height: 50*X,
        ),
        QuSkeleton(
          shape: BoxShape.rectangle,
          width: 50*X,
          height: 50*X,
          color: QuColors.theme,
          shimmerColor: QuColors.blue,
        ),
      ],
    );
  }
  
  Widget _textSkeleton(X){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        QuSkeleton(
          width: 330*X,
          height: 40*X,
          borderRadius: BorderRadius.circular(18),
        ),
        Text('QuSkeleton',style: TextStyle(
          color: QuColors.fontLightColorX
        ),),
      ],
    );
  }
  
}

/// 简单列表项
class SampleSkeletonItem extends StatelessWidget {
  final bool animation;
  const SampleSkeletonItem({
    Key key,
    this.animation=true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 14*X),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            QuSkeleton(
              width: 100*X,
              height: 100*X,
              active: animation,
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            Container(
              width: 230*X,
              height: 100*X,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      QuSkeleton(
                        width: 150*X,
                        height: 14*X,
                        active: animation,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey[300],
                      )
                    ],
                  ),
                 SizedBox(height: 6*X),
                 QuSkeleton(
                   active: animation,
                    width: 229*X,
                    height: 14*X,
                  ),
                  QuSkeleton(
                    active: animation,
                    width: 229*X,
                    height: 14*X,
                    margin: EdgeInsets.symmetric(vertical: 12*X),
                  ),
                  QuSkeleton(
                    active: animation,
                    width: 209*X,
                    height: 14*X,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}