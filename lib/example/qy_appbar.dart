import 'package:flutter/material.dart';
import '../global/qy_colors.dart';
import '../util/qu_screen.dart';
/*
* 本片封装的appBar 开发时发现没个页面的appBar差不多一样，
* 用法:
* appBar: PreferredSize(
          child: QYAppBar(
            title: 'QYButton',
          ),
          preferredSize:Size.fromHeight(44)),
* */
class QYAppBar extends StatelessWidget {
  final String title; //标题
  final bool bottomColor;//底部的边
  final bool isCenterTitle;//是否居中
  final bool haveLeftButton;//是否有左侧的返回小图标
  final Color appBarColor;//appBarr的背景色
  QYAppBar({Key key,
    this.title='',
    this.bottomColor=true,
    this.isCenterTitle=true,
    this.haveLeftButton=true,
    this.appBarColor = Colors.white,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    double X =QuScreen.X(context);
    return Container(
      decoration: BoxDecoration(
          border:Border(bottom: BorderSide(width: 1.0*X,
            color: bottomColor?Colors.grey[50]:QYColors.white,
          ),)
      ),
      child:AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        centerTitle:isCenterTitle,
        title: Text(title,style: TextStyle(
          fontSize: 17*X,
          color: QYColors.black,
        ),),
        leading:haveLeftButton? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:Container(
              color: appBarColor,
              padding: EdgeInsets.all(13.5),
              child: Image.asset('lib/images/bar_back.png'),
            )
        ):null,
      ),
    );
  }
}