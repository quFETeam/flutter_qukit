import 'package:flutter/material.dart';
import '../util/qu_screen.dart';
import '../constants/qu_colors.dart';

class QuBottomSheet {
  static Future function(
      context,
      Function takingPictures,
      Function photoAlbum,
      Function savePicture,
      ) {
    double X = QuScreen.X(context);
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          Widget _itemButton(
            X,
            text,
            Function function
          ) {
            return InkWell(
              onTap: () {
                function();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[300], width: 0.3)),
                ),
                height: 56 * X,
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16 * X, color: QuColors.black),
                  ),
                ),
              ),
            );
          }

          //取消
          Widget _cancel(context, X) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 25 * X),
                height: 80.0 * X,
                alignment: Alignment.center,
                child: Text(
                  '取消',
                  style: TextStyle(
                    color: QuColors.fontPrimaryColor,
                    fontSize: 16 * X,
                  ),
                ),
              ),
            );
          }

          return Container(
            height: QuScreen.screenHeight / QuScreen.pixelRatio,
            color: Colors.transparent,
            child: Container(
              height: 265 * X,
              margin: EdgeInsets.only(
                top: 195 * X,
              ), //控制底部的距离
              decoration: BoxDecoration(
                  color: QuColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Column(
                children: <Widget>[
                  _itemButton(
                     X,
                    '拍照',
                    takingPictures,
                  ),
                  _itemButton(
                    X,
                    '从手机相册选择',
                    photoAlbum,
                  ),
                  _itemButton(
                    X,
                    '保存图片',
                    savePicture,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 10 * X,
                    color: Colors.grey[200],
                  ),
                  _cancel(context, X),
                ],
              ),
            ),
          );
        });
  }
}
