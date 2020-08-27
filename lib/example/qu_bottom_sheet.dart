import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';

class QuBottomSheetExample extends StatefulWidget {
  @override
  _QuBottomSheetExampleState createState() => _QuBottomSheetExampleState();
}

class _QuBottomSheetExampleState extends State<QuBottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    double T = QuScreen.T(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14*X),
            margin: EdgeInsets.only(top: T),
            width: double.maxFinite,
            height: 44*X,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20*X,
                ),
                Text('个人头像',style: TextStyle(
                  color: QuColors.white,
                  fontSize: 15*X
                ),),
                Text('...',style: TextStyle(
                    color: QuColors.white,
                    fontSize: 15*X
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
