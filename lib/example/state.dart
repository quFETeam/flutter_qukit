import 'package:flutter/material.dart';

class A extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AState();
}

class AState extends State<A> {
  bool bDependenciesShouldChange = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 15), () {
      bDependenciesShouldChange = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    /// B`父级结构中的层级`发生变化时(`Scaffold`、`Container`、`C`、`B` => `Scaffold`、`Container`、`C`、`SizedBox`、`B`)， B会执行didChangeDependencies
    return bDependenciesShouldChange
        ? Scaffold(
        body: Container(
          height: 500,
          alignment: Alignment.centerLeft,
          child: C(child: B()),
        ))
        : Scaffold(
        body: Container(
          height: 500,
          alignment: Alignment.centerLeft,
          child: C(child: SizedBox(width: 20, height: 50, child: B())),
        ));

    // /// B`父级结构中的任一节点的widget类型`发生变化时(`Container` => `Center`)， B会执行didChangeDependencies
    // return bDependenciesShouldChange
    //     ? Scaffold(body: Center(child: C(child: B())))
    //     : Scaffold(
    //         body: Container(
    //         height: 500,
    //         alignment: Alignment.centerLeft,
    //         child: C(child: B()),
    //       ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("AdidChangeDependencies");
  }
}

class B extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BState();
}

class BState extends State<B> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("B"));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("BdidChangeDependencies");
  }
}

class C extends StatefulWidget {
  final Widget child;

  C({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CState();
}

class CState extends State<C> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("CdidChangeDependencies");
  }
}

class LifCycle extends StatefulWidget {
  @override
  _LifCycleState createState() => _LifCycleState();
}

class _LifCycleState extends State<LifCycle>with WidgetsBindingObserver {
  @override
  void initState(){
    WidgetsBinding.instance.addObserver(this);//添加观察者监听
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    switch (state){
      case AppLifecycleState.inactive:
      /// 应用程序处于非活动状态，没有接收用户输入
      /// On iOS
      /// 在Android上，这对应于一个应用程序或Flutter主机视图运行在前台非活动状态
      /// 当其他活动被关注时，应用程序会过渡到这种状态，比如分屏应用程序、电话呼叫、画中画应用程序、   /// 系统对话框或另一个窗口
      ///处于这种状态的应用程序应该假设它们可能在任何时候pause.
        break;
      case AppLifecycleState.resumed:
      //应用程序是可见的，并且响应用户输入
        break;
      case AppLifecycleState.paused:
      /// 应用程序当前对用户不可见，不响应用户输入，并在后台运行。
        break;
      case AppLifecycleState.detached:
      ///好像是断网了
      ///应用程序仍然驻留在Flutter引擎上，但是与任何主机视图分离。
      ///当应用程序处于这种状态时，引擎在没有视图的情况下运行。
        break;
    }
  }

  //内存回调
  @override
  void didHaveMemoryPressure(){
    super.didHaveMemoryPressure();
    print('内存过低，请注意清理');
  }

  //应用尺寸改变时回调
  @override
  void didChangeMetrics(){
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance.window.physicalSize;
    print("宽：${size.width}高：${size.height}");
  }

  //屏幕亮度发生变化的回调
  @override
  void didChangePlatformBrightness(){
    print('屏幕亮度发生了变化');
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
