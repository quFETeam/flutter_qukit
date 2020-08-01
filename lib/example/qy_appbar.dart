import 'package:flutter/material.dart';
import '../global/qy_colors.dart';
import '../util/qy_screen.dart';

class QYAppBar extends StatelessWidget {
  final String title;
  final bool bottomColor;
  final bool isCenterTitle;
  final bool haveLeftButton;
  final Color appBarColor;
  QYAppBar({Key key,
    this.title='',
    this.bottomColor=true,
    this.isCenterTitle=true,
    this.haveLeftButton=true,
    this.appBarColor = Colors.white,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    double X =QYScreen.X(context);
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
              padding: EdgeInsets.all(10.5),
              child: Image.asset('lib/images/bar_back.png'),
            )
        ):null,
      ),
    );
  }
}