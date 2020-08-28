import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../src/qu_bottom_sheet.dart';
/*
* 本片是一个仿微信换头像的底部弹出层，主要是看实现方法，UI可根据设计稿自己改
* */

class QuBottomSheetExample extends StatefulWidget {
  @override
  _QuBottomSheetExampleState createState() => _QuBottomSheetExampleState();
}

class _QuBottomSheetExampleState extends State<QuBottomSheetExample> {
  void _takingPictures() {
    print('拍照');
  }

  void _photoAlbum() {
    print('从相册获取');
  }

  void _savePicture() {
    print('保存图片');
  }

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
            padding: EdgeInsets.only(right: 14 * X),
            margin: EdgeInsets.only(top: T),
            width: double.maxFinite,
            height: 44 * X,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(13.5),
                    child: Image.asset('lib/images/backwhite.png',
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  '个人头像',
                  style: TextStyle(color: Colors.grey[300], fontSize: 15 * X),
                ),
                InkWell(
                  onTap: () {
                    QuBottomSheet.function(
                      context,
                      _takingPictures,
                      _photoAlbum,
                      _savePicture,
                    );
                  },
                  child: Text(
                    '···',
                    style: TextStyle(color: Colors.grey[300], fontSize: 15 * X),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: (QuScreen.screenHeight / QuScreen.pixelRatio -
                    (44 + T + 375 * X)) /
                3,
          ),
          Container(
            width: double.maxFinite,
            height: 375 * X,
            child: Image.asset(
              'lib/images/wuming_head0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
