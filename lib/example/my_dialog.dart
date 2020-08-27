import 'package:flutter/material.dart';
import '../src/qu_scaffold.dart';
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
    return QuScaffold(
        title: 'QuDialog', body:Center(
         child: QuButton(
          text: '点击弹窗',
             onTap: (){
          _onTap(context);
        }),
    ));
  }
}
