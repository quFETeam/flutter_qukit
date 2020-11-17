import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterqukit/src/qu_tab_indicator.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_button.dart';
import '../src/qu_scaffold.dart';


class QuStickyList extends StatefulWidget {
  @override
  _QuStickyListState createState() => _QuStickyListState();
}
/*
  
* */
class _QuStickyListState extends State<QuStickyList> with SingleTickerProviderStateMixin{

  final items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
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
  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        child: Text("浮动浮动浮动浮动浮动浮动浮动", style: TextStyle(fontSize: 18)),
      ),
    );
  }

//  Widget _buildStickyBar() {
//    return SliverPersistentHeader(
//      pinned: true, //是否固定在顶部
//      floating: true,
//      delegate: _SliverAppBarDelegate(
//          minHeight: 50, //收起的高度
//          maxHeight: 50, //展开的最大高度
//          child: Container(
//            padding: EdgeInsets.only(left: 16),
//            color: Colors.pink,
//            alignment: Alignment.centerLeft,
//            child: Text("浮动", style: TextStyle(fontSize: 18)),
//          )),
//    );
//  }
  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 50, //展开的最大高度
          child: Container(
            padding: EdgeInsets.only(left: 16),
            color: Colors.pink,
            alignment: Alignment.centerLeft,
            child: TabBar(
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
              labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 16),
              isScrollable: true,
              //是否集中展示
              tabs: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 44,
                  child: Text(
                    '男生榜单',
                    style: TextStyle(
                        color: QuColors.fontPrimaryColor,
                        fontSize: index == 0 ? 18 : 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 44,
                  child: Text(
                    '女生榜单',
                    style: TextStyle(
                        color: QuColors.fontPrimaryColor,
                        fontSize: index == 1 ? 18 : 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              height: 50,
              color: index % 2 == 0 ? Colors.white : Colors.black12,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("我是第${index}个item"),
            );
          },
          childCount: 30,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("标题")),
        body: CustomScrollView(
          slivers: <Widget>[
            _buildBanner(),
            _buildStickyBar(),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 555,
              child: TabBarView(controller: _tabController, children: [
                Center(
                  child: Text('X 指示器左右缩进的距离'),
                ),
                Center(
                  child: Text('B 指示器距离底部的距离'),
                ),
              ]),
            ),
          )
//            _buildList(),
          ],
        ));
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
