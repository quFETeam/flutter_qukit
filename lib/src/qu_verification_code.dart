import 'package:flutter/material.dart';
import 'dart:async';
class QuVerificationCode extends StatefulWidget {
  final int countdown;// 倒计时的秒数，默认60秒。
  final Function onTapCallback;// 用户点击时的回调函数,获取验证码的接口
  final bool available;// 是否可以获取验证码，默认为`false`。
  final TextStyle availableStyle;
  final TextStyle unavailableStyle;
  QuVerificationCode({
    this.countdown: 60, //默认六十秒 如果你调用的时候不赋值
    this.onTapCallback, //点击事件
    this.available: false,//按钮的状态 是否可用
    this.availableStyle,
    this.unavailableStyle,
  });
  @override
  _QuVerificationCodeState createState() => _QuVerificationCodeState();
}
class _QuVerificationCodeState extends State<QuVerificationCode> {
  // 可用时使用的字体样式。
  static  TextStyle _availableStyle;
  //不可用时使用的样式。
  static  TextStyle _unavailableStyle;

  Timer _timer;// 倒计时的计时控制器。
  int _seconds;// 当前倒计时的秒数。
  TextStyle inkWellStyle = _availableStyle;// 当前字体样式。
  String _verifyStr = '获取验证码';//初始化文本。
  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
    _availableStyle = widget.availableStyle;
    _unavailableStyle = widget.unavailableStyle;
  }
  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(
        Duration(seconds:1),
            (timer){
          if (_seconds == 0) {
            _seconds = widget.countdown;
            _cancelTimer();
            setState(() {});
            return;
          }
          _seconds--;
          _verifyStr = '获取验证码$_seconds'+'s';
          setState(() {});
          if (_seconds == 0) {
            inkWellStyle = _availableStyle;
            _verifyStr = '获取验证码';
          }
        });
  }
  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return widget.available ? InkWell(
      child: Text(
        _verifyStr,
        style: inkWellStyle,
      ),
      onTap: (_seconds == widget.countdown&&inkWellStyle==_availableStyle) ? (){
        _startTimer();
        inkWellStyle = _unavailableStyle;
        _verifyStr = '获取验证码$_seconds'+'s';
        setState(() {});
        widget.onTapCallback();
      } : null,
    ): InkWell(
      child: Text(
        '获取验证码',
        style: _unavailableStyle,
      ),
    );
  }
}

