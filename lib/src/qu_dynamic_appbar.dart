import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';

class QuDynamicAppbar extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Widget bodyWidget;
   QuDynamicAppbar({
     Key key,
     this.backgroundColor = Colors.white,
     @required this.title,
     @required this.bodyWidget,
   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          NotificationListener(
            // ignore: missing_return
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollNotification
                  && scrollNotification.depth == 0) {
                childKey0.currentState.onScroll(scrollNotification.metrics.pixels);
                childKey1.currentState.onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: bodyWidget,
          ),
          TopBar0(
            key: childKey0,
          ),
          TopBar1(
            key: childKey1,
            title:title,
          ),
        ],
      ),
    );
  }
}



const APPBAR_SCROLL_OFFSET = 200;
GlobalKey<_TopBar0State> childKey0 = GlobalKey();
class TopBar0 extends StatefulWidget {
  TopBar0({Key key}) : super(key: key);

  @override
  _TopBar0State createState() => _TopBar0State();
}
class _TopBar0State extends State<TopBar0> {
  double appBarAlpha = 0;
  void onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
  @override
  Widget build(BuildContext context) {
    double X  = QuScreen.X(context);
    var Y = MediaQueryData.fromWindow(window).padding.top;
    return Opacity( //透明度的组件
      opacity: 1-appBarAlpha, //值越大，月显示底下的容器颜色（0~1）
      child: Container(
        width: double.maxFinite,
        height: 44+Y,
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        padding: EdgeInsets.only(top: (44+Y)/2,left:9,right: 9*X ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              height: 24*X,
              width: 24*X,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54
              ),
              child: Image.asset('lib/images/backwhite.png',fit: BoxFit.fitHeight,),
            ),
            SizedBox(
              height: 24*X,
              width: 24*X,
            ),
          ],
        ),
      ),);
  }
}



GlobalKey<_TopBar1State> childKey1 = GlobalKey();
class TopBar1 extends StatefulWidget {
  final String title;
  TopBar1({Key key,this.title}) : super(key: key);
  @override
  _TopBar1State createState() => _TopBar1State();
}
class _TopBar1State extends State<TopBar1> {
  double appBarAlpha = 0;
  void onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    double X  = QuScreen.X(context);
    var Y = MediaQueryData.fromWindow(window).padding.top;
    return Opacity( //透明度的组件
      opacity: appBarAlpha, //值越大，月显示底下的容器颜色（0~1）
      child: Container(
        width: double.maxFinite,
        height: 44+Y,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.only(top: (44+Y)/2,left:9,right: 9*X ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 24*X,
                width: 24*X,
                padding: EdgeInsets.all(4),
                child: Image.asset('lib/images/bar_back.png',fit: BoxFit.fitHeight,),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 44*X,
              width: 320*X,
              child: Text(widget.title,style: TextStyle(
                color: QuColors.fontPrimaryColor,
                fontSize: 16*X,
                fontWeight: FontWeight.w600,
              ),maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),);
  }
}

