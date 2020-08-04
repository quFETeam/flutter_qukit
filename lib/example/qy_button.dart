import 'package:flutter/material.dart';
import '../global/qy_colors.dart';
import '../util/qy_screen.dart';
import 'qy_appbar.dart';
/*
本篇介绍了Container的属性，并封装了小按钮
* */
class QYButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QYScreen.X(context);
    return Scaffold(
      backgroundColor: QYColors.backgroundColor,
      appBar: PreferredSize(
          child: QYAppBar(
            title: 'QYButton',
          ),
          preferredSize:Size.fromHeight(44)),
      body:Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20*X,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _containerFirst(X),
                _containerSecond(X),
              ],
            ),
            SizedBox(height: 20*X,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _containerThird(X),
                _containerFourth(X),
              ],
            ),
            SizedBox(height: 40*X,),
            Protagonist(
              text: '呵呵',
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerFirst(X){
    //容器的背景图片
    return Container(
      width: 150*X,height: 150*X,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image:AssetImage(
             'lib/images/wuming_01.jpeg',)
        ),
      ),
    );
  }

  Widget _containerSecond(X){
    //容器的颜色渐变
    return Container(
      width: 150*X,height: 200*X,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              QYColors.theme,
              QYColors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
    );
  }

  Widget _containerThird(X){
    //容器的阴影
    return Container(
      width: 150*X,height: 200*X,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: QYColors.theme,
            offset: Offset(0, 5), //阴影的偏移量
            blurRadius: 10.0, //阴影的模糊程度 扩散程度
            spreadRadius: 5.0, //阴影的大小
          )
        ],
      ),
    );
  }

  Widget _containerFourth(X){
    //容器的最小（同理最大）
    return Container(
      constraints: BoxConstraints(
        minHeight: 200*X,
        minWidth: 150*X,
      ),
      decoration: BoxDecoration(
        color: QYColors.theme,
        //四个边
        border:Border.all(
          color: QYColors.black,
          width: 2
        ),

       //单独设置
//        border: Border(
//          bottom: BorderSide(
//            color: QYColors.black,
//              width: 0.5
//          )
//        ),

       //四个角设置圆角
       borderRadius: BorderRadius.circular(5),

       //单独一个
//        borderRadius:BorderRadius.only(
//          topRight: Radius.circular(5),
//          bottomRight:Radius.circular(5),
//        )
      ),
    );
  }

}

class Protagonist extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final String text;
  final double textSize;
  Protagonist({
    Key key,
    this.width=250,
    this.height=50,
    this.borderRadius=15.0,
    this.borderColor=Colors.white,
    this.borderWidth=1.0,
    this.text= '呵呵',
    this.textSize = 16,
  }) : super(key: key);
  @override
  _ProtagonistState createState() => _ProtagonistState();
}

class _ProtagonistState extends State<Protagonist> {
  String text = '';
  @override
  void initState() {
    text = widget.text;
    super.initState();
  }

  void _tap(){
    setState(() {
      text =='呵呵'?text='哈哈':text ='呵呵';
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _tap();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color:QYColors.theme,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth
          )
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            color: QYColors.black,
            fontSize: widget.textSize
          ),),
        ),
      ),
    );
  }
}



