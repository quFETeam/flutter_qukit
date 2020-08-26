import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';

class QuTurnPageAtlas extends StatefulWidget {
  @override
  _QuTurnPageAtlasState createState() => _QuTurnPageAtlasState();
}

class _QuTurnPageAtlasState extends State<QuTurnPageAtlas>with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _animation1;

  @override
  void initState() {

    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..addListener(() {
        setState(() {});
        print(_controller.status);
        _nextImg();
      });
    _animation = Tween(begin: 0.0, end: pi / 2)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)));
    _animation1 = Tween(begin: -pi / 2, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));
    super.initState();
  }
  int i = 1;
  void _nextImg(){
    if (_controller.status == AnimationStatus.completed) {
      setState(() {});
      _controller.reset();
      image0 = imgList[i];
      image1 = imgList[i + 1];
      i++;
      if (i == imgList.length - 1) {
        i = 0;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  static List imgList = [
    'lib/images/wuming_vertical1.jpg',
    'lib/images/wuming_vertical2.jpg',
    'lib/images/wuming_vertical3.jpg',
    'lib/images/wuming_vertical4.jpg',
    'lib/images/wuming_vertical5.jpg',
    'lib/images/wuming_vertical6.jpg',
    'lib/images/wuming_vertical7.jpg',
  ];

  String image0 = imgList[0];
  String image1 = imgList[1];

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      backgroundColor: QuColors.black,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 30 * X),
            height: 50 * X,
            width: double.maxFinite,
            child: Center(
              child: Text(
                '无名图集',
                style: TextStyle(color: QuColors.white, fontSize: 16 * X),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  _bottomImg(image0,Alignment.centerLeft),
                  _topImg(Alignment.centerRight, _animation1,image1),
                ],
              ),
              Stack(
                children: [
                  _bottomImg(image1,Alignment.centerRight),
                  _topImg(Alignment.centerLeft, _animation,image0),
                ],
              )
            ],
          ),
          Container(
            width: 80 * X,
            height: 30 * X,
            child: InkWell(
              onTap: () {
                _controller.reset();
              },
              child: Center(
                child: Text(
                  '动画结束',
                  style: TextStyle(color: QuColors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30 * X,
            width: double.maxFinite,
          ),
          Container(
            width: 80 * X,
            height: 30 * X,
            child: InkWell(
              onTap: () {
                _controller.forward();
              },
              child: Center(
                child: Text(
                  '下一张',
                  style: TextStyle(color: QuColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //左边压在底下的图片
  Widget _bottomImg(String img,Alignment alignment) {
    return ClipRect(
      child: Align(
        alignment: alignment,
        widthFactor: 0.5,
        child: Container(
          width: 300,
          height: 400,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  //上面的图片
  Widget _topImg(Alignment alignment,Animation animation,String img){
    return Transform(
      alignment: alignment,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(animation.value),
      child: ClipRect(
        child: Align(
          alignment: alignment==Alignment.centerRight?Alignment.centerLeft:Alignment.centerRight,
          widthFactor: 0.5,
          child: Container(
            width: 300,
            height: 400,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
