import 'package:flutter/material.dart';

//仿抖音点赞的动效
class QuAnimationPraise extends StatefulWidget {
  final IconData icon;
  final double size;
  QuAnimationPraise({this.size, this.icon=Icons.favorite});
  @override
  _QuAnimationPraiseState createState() => _QuAnimationPraiseState();
}
class _QuAnimationPraiseState extends State<QuAnimationPraise>with TickerProviderStateMixin {
  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;

  Animation <double>_animation1;
  Animation <double>_animation2;
  Animation <double>_animation3;

  Animation<double> curAnimation;

  Color curColor;

  @override
  void initState(){
    super.initState();
    _controller1=AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    _controller2=AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _controller3=AnimationController(vsync: this,duration: Duration(milliseconds: 100));


    curColor=Colors.grey[100];
    _animation1=Tween(begin: 1.0,end:0.0 ).animate(_controller1)..addListener((){
      setState(() {

      });
    })..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _controller2.forward(from: 0);
        curAnimation=_animation2;
        curColor=Colors.redAccent;
      }
    });

    _animation2=Tween(begin: 0.0,end:0.2 ).animate(_controller2)..addListener((){
      setState(() {

      });
    })..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _controller3.forward(from: 0);
        curAnimation=_animation3;

      }
    });

    _animation3=Tween(begin: 1.4,end:1.0 ).animate(_controller3)..addListener((){
      setState(() {

      });
    });
    curAnimation=_animation1;
    _controller1.forward(from: 0);
  }

  Widget build(BuildContext context) {
    return Container(
        child: Icon(
          widget.icon,
          size:widget.size* curAnimation.value,
          color: curColor,
        ),
    );
  }
}

//旋转动画
class QuRotatingIcon extends StatefulWidget {
  final Widget rotatingWidget;
  QuRotatingIcon({
    Key key,
    @required this.rotatingWidget
  }) : super(key: key);
  @override
  _QuRotatingIconState createState() => _QuRotatingIconState();
}

class _QuRotatingIconState extends State<QuRotatingIcon>with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 2));//几秒转一圈
    animation=RotationTransition(turns: Tween(begin: 0.0,end:1.0)//必须是double，int类型出不来效果
        .animate(_controller)
      ..addStatusListener((status){//为了让它一直转动
        if(status==AnimationStatus.completed){
          _controller.forward(from: 0.0);
        }
      }),
      child: widget.rotatingWidget);//想要什么转动 就放到这里吧
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(_controller.status==AnimationStatus.dismissed){
          _controller.forward(from: 0.0);
        }else{
          _controller.reset();
        }
      },
      child: Container(
        child: animation,
      ),
    );
  }
}