import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';
import 'qu_button.dart';

class QuDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool showTitle;
  final Color cancelBtnColor;
  final Color cancelTextColor;
  final String cancelText;
  final Color confirmBtnColor;
  final Color confirmTextColor;
  final String confirmText;
  final bool canClose;
  final GestureTapCallback onCancelTap;
  final GestureTapCallback onConfirmTap;

  QuDialog(
      {Key key,
      this.title = '标题',
      this.content = '内容',
      this.showTitle = true,
      this.cancelBtnColor=Colors.grey,
      this.cancelTextColor=Colors.white,
      this.cancelText='取消',
      this.confirmBtnColor=Colors.yellow,
      this.confirmTextColor=Colors.white,
      this.confirmText='确定',
      this.canClose=false,
      this.onCancelTap,
      this.onConfirmTap})
      : super(key: key);

  _onCancelTap(context){
    if(onCancelTap==null){
      Navigator.pop(context);
    }else{
      onCancelTap();
    }
  }

  _onConfirmTap(context){
    if(onConfirmTap!=null){
      onConfirmTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            color: QuColors.popBgColor,
            child: InkWell(
              onTap: canClose?() {
                Navigator.pop(context);
              }:null,
            ),
          ),
          Positioned(
            left: 43 * X,
            top: 293.5 * X,
            child: _viewUI(X, context),
          ),
        ],
      ),
    );
  }

  Widget _title(X){
    return showTitle? Container(
      margin: EdgeInsets.only(bottom: 20 * X),
      child: Text(
        title,
        style: TextStyle(
            color: QuColors.fontPrimaryColor,
            fontSize: 17 * X),
      ),
    ): Container();
  }

  //页面UI
  Widget _viewUI(X, context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: QuColors.white),
      width: 300 * X,
      height: 180 * X,
      child: Column(
        children: <Widget>[
          Container(
            height: 130 * X,
            padding: EdgeInsets.fromLTRB(37.5 * X, 0, 37.5 * X, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(X),
                Text(
                  content,
                  style: TextStyle(
                      color: QuColors.fontPrimaryColor, fontSize: 15 * X),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          _buttonS(X, context),
        ],
      ),
    );
  }

  //两个按钮
  Widget _buttonS(X, context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.5 * X),
      width: 300 * X,
      height: 34 * X,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          QuButton(
            onTap: () {
              _onCancelTap(context);
            },
            width: 114,
            height: 33,
            active: false,
            primaryColor: cancelBtnColor,
            text: cancelText,
            textSize: 16,
            textColor: cancelTextColor,
          ),
          QuButton(
            onTap: () {
              _onConfirmTap(context);
            },
            width: 114,
            height: 33,
            active: false,
            primaryColor: confirmBtnColor,
            text: confirmText,
            textSize: 16,
            textColor: confirmTextColor,
          ),
        ],
      ),
    );
  }
}
