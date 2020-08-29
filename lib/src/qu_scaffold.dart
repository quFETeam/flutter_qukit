import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
/*
* 本片封装的 appBar 开发时发现没个页面的appBar差不多一样，
* 用法:
* QuScaffold(
          title: 'QuScaffold',
          body:
         ),
* */
class QuScaffold extends StatelessWidget {
  final String title; //标题
  final bool bottomColor;//底部的边
  final bool isCenterTitle;//是否居中
  final bool haveLeftButton;//是否有左侧的返回小图标
  final Color appBarColor;//appbar的颜色
  final Color backgroundColor;//页面背景色
  final Widget body;
  const QuScaffold({Key key,
    this.bottomColor=true,
    this.isCenterTitle=true,
    this.haveLeftButton=true,
    this.appBarColor = Colors.white,
    this.backgroundColor =Colors.white,
    @required this.title,
    @required this.body,
  }) : super(key: key);//appBarr的背景色
  @override
  Widget build(BuildContext context) {
    double X =QuScreen.X(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                border:Border(bottom: BorderSide(width: 1.0*X,
                  color: bottomColor?Colors.grey[50]:QuColors.white,
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
                color: QuColors.black,
              ),),
              leading:haveLeftButton? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:Container(
                    color: appBarColor,
                    padding: EdgeInsets.fromLTRB(6.5,13.5,20.5,13.5),
                    child: Image.asset('lib/images/bar_back.png'),
                  )
              ):null,
            ),
          ),
          preferredSize: Size.fromHeight(44)),
      body: body,
    );
  }
}
