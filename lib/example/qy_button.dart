import 'package:flutter/material.dart';
import '../global/qy_colors.dart';
import '../util/qy_screen.dart';
import 'qy_appbar.dart';

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
      body: Center(
        child: Protagonist(
          
        ),
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
    this.width=100,
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('hehe');
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
          child: Text(widget.text,style: TextStyle(
            color: QYColors.black,
            fontSize: widget.textSize
          ),),
        ),
      ),
    );
  }
}



