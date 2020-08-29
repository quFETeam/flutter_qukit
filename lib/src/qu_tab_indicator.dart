import 'package:flutter/material.dart';
class QuTabIndicator extends Decoration {
  const QuTabIndicator({
    this.X = 0,//指示器左右缩进的距离
    this.B = 0,//指示器距离底部的距离
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  }) : assert(borderSide != null),
        assert(insets != null);
  final BorderSide borderSide;
  final double X ;
  final double B;
  final EdgeInsetsGeometry insets;
  @override
  _UnderlinePainter createBoxPainter([ VoidCallback onChanged ]) {
    return _UnderlinePainter(this, onChanged,X,B);
  }
}
class _UnderlinePainter extends BoxPainter {
  final double X;
  final double B;
  _UnderlinePainter(this.decoration, VoidCallback onChanged,this.X,this.B)
      : assert(decoration != null),
        super(onChanged);
  final QuTabIndicator decoration;
  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;
  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left+X,
      indicator.bottom - borderSide.width,
      indicator.width-2*X,
      borderSide.width-B,
    );
//    //希望的宽度
//    double wantWidth = 25;
//    //取中间坐标
//    double cw = (indicator.left + indicator.right) / 2;
//    return Rect.fromLTWH(cw - wantWidth / 2,
//        indicator.bottom - borderSide.width, wantWidth, borderSide.width);
  }
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator = _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
//    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.square;
    // 改为圆角
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}