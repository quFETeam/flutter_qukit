import 'package:flutter/material.dart';
import '../util/qu_screen.dart';

class QuButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color primaryColor;
  final Color disabledColor;
  final Color activeColor;
  final Color borderColor;
  final Color textColor;
  final Color disabledTextColor;
  final Color activeTextColor;
  final String text;
  final double textSize;
  final bool disabled;
  final bool active;
  final GestureTapCallback onTap;

  QuButton(
      {Key key,
      this.width = 295,
      this.height = 48,
      this.borderRadius = 2,
      this.borderWidth = 0,
      this.primaryColor = Colors.yellow,
      this.disabledColor = Colors.grey,
      this.activeColor = Colors.blue,
      this.borderColor = Colors.white,
      this.textColor = Colors.white,
      this.activeTextColor=Colors.white,
      this.disabledTextColor = Colors.white,
      this.text = '按钮',
      this.textSize = 16,
      this.disabled=false,
      this.active=false,
      this.onTap})
      : super(key: key);

  _onTap(){
    if(disabled)return;
    onTap();
  }
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: width * X,
        height: height * X,
        decoration: BoxDecoration(
            color: disabled?disabledColor:active?activeColor:primaryColor,
            borderRadius: BorderRadius.circular(borderRadius*X),
            border: Border.all(color: borderColor, width: borderWidth*X)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: disabled?disabledTextColor:active?activeTextColor:textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
