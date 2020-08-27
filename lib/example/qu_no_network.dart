import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:connectivity/connectivity.dart';
import '../constants/qu_colors.dart';
import '../src/qu_scaffold.dart';

class QuNoNetwork1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuScaffold(
      title: 'QuNoNetwork', body: OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: QuColors.white,
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
    ));
  }
}

class QuNoNetwork2 extends StatefulWidget {
  @override
  _QuNoNetwork2State createState() => _QuNoNetwork2State();
}

class _QuNoNetwork2State extends State<QuNoNetwork2> {
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
      return QuScaffold(
        title:'QuNoNetwork',
        body: Center(
         child: Text(_isHaveNetwork?'有网':'无网'),
       ),
      );
    }
  }