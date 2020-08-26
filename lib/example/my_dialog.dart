import 'package:flutter/material.dart';
import '../src/qu_appbar.dart';
import '../util/qu_screen.dart';
import '../util/qu_pop_route.dart';
import '../src/qu_button.dart';
import '../src/qu_dialog.dart';

/*
  QuDialog
* */
class MyDialog extends StatelessWidget {

  _onTap(context) {
    Navigator.push(context, QuPopRoute(child:(QuDialog(
        title: '提交成功',
        content:'找到该书后将立即通知您，您可以先去书城逛逛，发现更多好书～',
//        onCancelTap:_onCancelTap,
        onConfirmTap: _onConfirmTap
    ))));
  }
  _onCancelTap(){
    print('取消');
  }
  _onConfirmTap(){
    print('确定');
  }
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
        appBar: PreferredSize(
            child: QuAppBar(
              title: 'QuDialog',
            ),
            preferredSize: Size.fromHeight(44)),
        body: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10 * X,
              ),
              QuButton(onTap: (){
                _onTap(context);
//                Navigator.push(context, QuPopRoute(child:(QuDialog())));
              }),
            ],
          ),
        ));
  }
}
