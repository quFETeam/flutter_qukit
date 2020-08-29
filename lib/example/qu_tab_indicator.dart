import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';
import '../src/qu_tab_indicator.dart';
/*
*本页介绍的是指示器圆角的封装（tab_bar的属性没有相关属性）。
* 介绍一种解决当选中和未选中的tab的大小不一样时候的抖动问题,
* 缺点是不是实时变化的
* */

class QuTabIndicatorExample extends StatefulWidget {
  @override
  _QuTabIndicatorExampleState createState() => _QuTabIndicatorExampleState();
}

class _QuTabIndicatorExampleState extends State<QuTabIndicatorExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: index, vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      backgroundColor: QuColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: QuColors.fontLightColorX),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: QuColors.white,
        elevation: 0.3,
        title: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: QuTabIndicator(
              X: 20,
              B: 8,
              borderSide: BorderSide(
                width: 3,
                color:QuColors.theme,
              )),
          labelColor: QuColors.theme,
          unselectedLabelColor: QuColors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16 * X),
          unselectedLabelStyle: TextStyle(fontSize: 16 * X),
          isScrollable: true,
          //是否集中展示
          tabs: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 80 * X,
              height: 44 * X,
              child: Text(
                '男生榜单',
                style: TextStyle(
                    color: QuColors.fontPrimaryColor,
                    fontSize: index == 0 ? 18 * X : 14 * X,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 80* X,
              height: 44 * X,
              child: Text(
                '女生榜单',
                style: TextStyle(
                    color: QuColors.fontPrimaryColor,
                    fontSize: index == 1 ? 18 * X : 14 * X,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
         Center(
           child: Text('X 指示器左右缩进的距离'),
         ),
         Center(
           child: Text('B 指示器距离底部的距离'),
         ),
      ]),
    );
  }
}
