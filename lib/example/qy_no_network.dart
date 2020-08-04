import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:connectivity/connectivity.dart';
import '../global/qy_colors.dart';
import 'qy_appbar.dart';

class QYNoNetwork1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(child: QYAppBar(
        title: 'QYNoNetwork',
      ), preferredSize:Size.fromHeight(44)),
      body:OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: QYColors.white,
            child: Center(
              child: Text(
                "现在没网了，请重新加载",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
        return child;
      },
       child: Center(
        child:Text('现在是有网状态下的UI，\n有延迟是因为手机联网'),
      ),
    ),
    );
  }
}

class QYNoNetwork2 extends StatefulWidget {
  @override
  _QYNoNetwork2State createState() => _QYNoNetwork2State();
}

class _QYNoNetwork2State extends State<QYNoNetwork2> {
  @override
  void initState(){
    _isConnected();
    super.initState();
  }

  //判断是否有网的
  bool _isHaveNetwork = true;

  void _isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isHaveNetwork = false;
      });
    } else {
      setState(() {
        _isHaveNetwork = true;
      });
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: PreferredSize(child: QYAppBar(
          title: 'QYNoNetwork',
        ), preferredSize:Size.fromHeight(44)),
        body: Center(
          child: Text(_isHaveNetwork?'有网':'无网'),
        ),
      );
    }

  }