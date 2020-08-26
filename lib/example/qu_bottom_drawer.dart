import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_appbar.dart';
import '../src/bottom_drag_widget.dart';
/*
* 本页是一个上拉抽屉的组件
* 引入" bottom_drag_widget.dart"
* body dragContainer 和 bottomBar 是三个必须构建的自定义widget
* */

class QuBottomDrawer extends StatefulWidget {
  @override
  _QuBottomDrawerState createState() => _QuBottomDrawerState();
}

class _QuBottomDrawerState extends State<QuBottomDrawer> {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      appBar: PreferredSize(
          child: QuAppBar(
            title: 'QuBottomDrawer',
          ), preferredSize: Size.fromHeight(44)),
      backgroundColor: QuColors.white,
      body: SafeArea(
        child:BottomDragWidget(
            body: _bodyView(X),
            //dragContainer 里面的 除了_drawerView(X), 其它为固定写法
            dragContainer: DragContainer(
                drawer: Container(
                  child: OverScrollNotificationWidget(
                    child:_drawerView(X),
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 244, 248),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                ),
                defaultShowHeight: 667*X* 0.2, //抽屉收缩起来的高度
                height: 667*X * 0.8),//抽屉展开时的高度
          bottomBar: _bottomBar(X),
        ),
      ),
    );
  }

  //抽屉下的页面UI
  Widget _bodyView(X){
    return Container(
      alignment: Alignment.topCenter,
      width: double.maxFinite,
      height: 667*X,
      child: Container(
        decoration: BoxDecoration(
          color: QuColors.theme,
          shape: BoxShape.circle
        ),
        height: 150*X,width: 150*X,
        child: InkWell(
          onTap: (){
            print('QuBottomDrawer');
          },
        ),
      ),
    );
  }

  //抽屉里的内容
  Widget _drawerView(X) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: QuColors.white,
            margin: EdgeInsets.only(top: 20 * X),
            width: double.maxFinite,
            height: 40 * X,
            child: Center(
              child: Text('第$index条评论', style: TextStyle(
                  color: QuColors.fontLightColorX,
                  fontSize: 15 * X
              ),),
            ),
          );
        }
    );
  }
  
  //底部导航栏的UI
  Widget _bottomBar(X){
    return Container(
      alignment: Alignment.center,
      width: 375*X,height: 44*X,
      color: QuColors.theme,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: QuColors.white,
            ),
            width: 150*X,
            height: 23*X,
          ),
          Container(
            height: 23*X,width: 23*X,
            color: QuColors.white,
          ),
          Container(
            height: 23*X,width: 23*X,
            color: QuColors.white,
          ),
          Container(
            height: 23*X,width: 23*X,
            color: QuColors.white,
          ),
        ],
      ),
    );
  }
  
}
