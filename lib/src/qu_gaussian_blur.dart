import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterqukit/util/qu_screen.dart';

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
  final Widget bottomWidget;
  final Widget topWidget;
  final double sigma;

  QuCoverBlur({Key key,
    @required this.bottomWidget,
    @required this.topWidget,
    this.sigma = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          bottomWidget,
          Positioned.fill(
            child:BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          topWidget,
        ],
      ),
    );
  }
}
