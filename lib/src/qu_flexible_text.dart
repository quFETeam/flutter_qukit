import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuFlexibleText extends StatefulWidget {
  final String text;
  final double maxWidth;//越小 越容易可收缩
  final double containerWith;//装伸缩文本 容器的宽度
  final double containerCircular;//装伸缩文本容器的圆角
  final double paddingVertical;//文本内容距离容器上下的距离
  final double paddingHorizontal;//文本内容距离容器左右的距离
  final double textSize;//伸缩文本 文字的的大小
  final Color textColor;
  final String iconUpAssets;//按钮收回图标文件的位置
  final String iconDownAssets;//按钮展开图标文件的位置
  final double iconWith;//点击按钮的图标宽度
  final double iconHeight;//点击按钮的图标高度
  final double iconBottom;//按钮图标距离容器下边的距离
  final double iconRight;//按钮图标距离容器右边的距离
  final double inkwellSize;//按钮的大小
  final double inkwellBottom;//按钮距离底边的距离
  final int sSTextMaxLines;//收缩的时候文本最大行数
  final Color backgroundColor;//容器的背景色
  QuFlexibleText({
    Key key ,
    @required this.text,
    @required this.iconUpAssets,
    @required this.iconDownAssets,
    this.maxWidth=100,
    this.textSize=14,
    this.textColor = Colors.black,
    this.containerWith = 340,
    this.containerCircular =5,
    this.paddingVertical = 10,
    this.paddingHorizontal = 10,
    this.iconWith = 40,
    this.iconHeight = 22,
    this.iconBottom = 44,
    this.iconRight = 7.5,
    this.inkwellSize = 40,
    this.inkwellBottom =33,
    this.sSTextMaxLines = 5,
    this.backgroundColor = Colors.white
  }): super(key: key);
  @override
  _QuFlexibleTextState createState() => _QuFlexibleTextState();
}
class _QuFlexibleTextState extends State<QuFlexibleText> {
  @override
  Widget build(BuildContext context,){
    return  _richText(widget.text);
  }
  bool mIsExpansion = false;
//_text：显示的文字
  bool isExpansion(String text) {
    TextPainter _textPainter = TextPainter(
        maxLines: 3,
        text: TextSpan(
            text: text,
            //默认的字体颜色和大小
            style: TextStyle(fontSize: 12.0, color: Colors.black)
        ),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: widget.maxWidth, minWidth: 90);
    if (_textPainter.didExceedMaxLines) {//这里判断 文本是否截断
      return true;
    } else {
      return false;
    }
  }
  Widget _richText(String _text) {
    if (isExpansion(_text)) {
//      如果需要截断
      if (mIsExpansion) {
        return Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                width: widget.containerWith,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.containerCircular),
                    color: widget.backgroundColor
                ),
                padding: EdgeInsets.symmetric(vertical: widget.paddingVertical, horizontal: widget.paddingHorizontal),
                child:Text(
                  _text,style: TextStyle(fontSize:widget.textSize,color: widget.textColor),
                  maxLines: 15,//展开后的最大行数,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                  bottom: widget.iconBottom, right:widget.iconRight,
                  child:Container(
                    width: widget.iconWith,height: widget.iconHeight,
                    child: Image.asset(widget.iconUpAssets,fit: BoxFit.fill,),
                  )
              ),
              Positioned(
                bottom: widget.inkwellBottom, right:0,
                width: widget.inkwellSize,
                height: widget.inkwellSize,
                child:InkWell(
                  onTap: (){
                    _isShowText();
                  },
                ),
              ),
            ],
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                width: widget.containerWith,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.containerCircular),
                    color: widget.backgroundColor
                ),
                padding: EdgeInsets.symmetric(vertical: widget.paddingVertical, horizontal: widget.paddingHorizontal),
                child:Text(
                  _text,style: TextStyle(fontSize:widget.textSize,color: widget.textColor),
                  maxLines: widget.sSTextMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                  bottom: widget.iconBottom, right:widget.iconRight,
                  child:Container(
                    width: widget.iconWith,height: widget.iconHeight,
                    child: Image.asset(widget.iconDownAssets,fit: BoxFit.fill,),
                  )
              ),
              Positioned(
                bottom: widget.inkwellBottom, right:0,
                width: widget.inkwellSize,
                height: widget.inkwellSize,
                child:InkWell(
                  onTap: (){
                    _isShowText();
                  },
                ),
              ),
            ]
            )
          ],
        );
      }
    } else {
      return Column(
        children: <Widget>[
          Container(
            width: widget.containerWith,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.containerCircular),
                color: widget.backgroundColor
            ),
            padding: EdgeInsets.symmetric(vertical: widget.paddingVertical, horizontal: widget.paddingHorizontal),
            child:Text(
              _text,style: TextStyle(fontSize:widget.textSize,color: widget.textColor),
              maxLines: widget.sSTextMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );
    }
  }
  void _isShowText() {
    if (mIsExpansion) {
      //关闭了
      setState(() {
        mIsExpansion = false;
      });
    } else {
      setState(() {
        mIsExpansion = true;
      });
    }
  }
}
