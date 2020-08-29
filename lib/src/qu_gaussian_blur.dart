import 'dart:ui';
import 'package:flutter/material.dart';

class QuBlurOval extends StatelessWidget {
  final Widget widget;
  final double padding;
  final double sigma;

  QuBlurOval(
      {Key key, @required this.widget, this.padding = 10.0, this.sigma = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
        ),
        child: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(padding),
          child: widget,
        ),
      ),
    );
  }
}

class QuBlurRect extends StatelessWidget {
  final Widget widget;
  final double padding;
  final double sigma;
  final double width;
  const QuBlurRect({
    Key key,
    @required this.widget,
    @required this.width,
    this.padding = 10.0,
    this.sigma = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigma,
            sigmaY: sigma,
          ),
          child: Container(
            color: Colors.white10,
            padding: EdgeInsets.all(padding),
            child: widget,
          ),
        ),
      ),
    );
  }
}

class QuCoverBlur extends StatelessWidget {
  final ImageProvider image;//背景图片网络图片还是本地图片自定义
  final double imgH; //图片的高
  final double imgW;//图片的宽
  final Widget topWidget;//模糊容器内的UI
  final double sigma; //模糊程度
  final double doubleRadius;//模糊容器的圆角

  QuCoverBlur({Key key,
    @required this.image,
    @required this.topWidget,
    this.sigma = 15,
    this.doubleRadius = 10.0,
    this.imgH,
    this.imgW})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: imgW,
        height: imgH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(doubleRadius),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(doubleRadius)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: Container(
                width: imgW,
                height: imgH,
                color: Colors.transparent,
                 child:topWidget,
              ),
            )
        )
    );
  }
}
