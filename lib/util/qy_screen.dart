import 'package:flutter/material.dart';
class QYScreen{
  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;

  static void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
  }

  static double X(BuildContext context){
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    double screenWidth = _screenWidth * _pixelRatio;
    return screenWidth / (375 * _pixelRatio);
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// 当前设备宽度 px
  /// The vertical extent of this size. px
  static double get screenWidth => _screenWidth * _pixelRatio;

  /// 当前设备高度 px
  /// The vertical extent of this size. px
  static double get screenHeight => _screenHeight * _pixelRatio;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// 底部安全区距离 dp
  /// The offset from the bottom.
  static double get bottomSecurityHeight => _bottomBarHeight;

}