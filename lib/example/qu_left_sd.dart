import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_left_sd.dart';
import '../src/qu_scaffold.dart';

class QuLeftSDExample extends StatefulWidget {
  @override
  _QuLeftSDExampleState createState() => _QuLeftSDExampleState();
}

class _QuLeftSDExampleState extends State<QuLeftSDExample> {
  @override
  void initState(){
    _getData();
    super.initState();
  }

  List<QuLeftSDModel> _quLeftSDList = [];

  List dataList =[
    {
      'msg_uuid':'7099f791-3d0b-46a3-9777-1f4a819a6926',
      'message':'这是第一条消息',
    },
    {
      'msg_uuid':'7088f791-3d0b-46a3-8777-1f4a819a6926',
      'message':'这是第二条消息',
    },
    {
      'msg_uuid':'7077f791-3d0b-46a3-7777-1f4a819a6926',
      'message':'这是第三条消息',
    },
    {
      'msg_uuid':'70966f791-3d0b-46a3-6777-1f4a819a6926',
      'message':'这是第四条消息',
    },
    {
      'msg_uuid':'70916f791-3d0b-46a3-6777-1f4a819b6926',
      'message':'这是第五条消息',
    },
    {
      'msg_uuid':'70916f791-3d0b-4ca3-6n77-1f4a819b6926',
      'message':'这是第六条消息',
    },
  ];

  void _getData(){
    for (var item in dataList) {
      _quLeftSDList.add(QuLeftSDModel.fromJson(item));
    }
   setState(() {

   });
  }
//  var encryptDataResObj = json.decode(encryptDataRes);
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        title: 'QuLeftSDExample', 
        body: QuLeftSD.builder(
          shrinkWrap: true,
          count: _quLeftSDList.length,
          builder: (BuildContext context,int index){
            return QuLeftSDItem(
              key: _quLeftSDList[index].msgUuid,
              onTap: (){
                print('点几了一条消息');
              },
              child: _viewItem(X,_quLeftSDList[index].message),
              buttons: [
                LeftScrollItem(
                  text: '删除',
                  color:QuColors.red,
                  onTap: (){
                    if (_quLeftSDList.contains(_quLeftSDList[index])) {
                      setState(() {
                        _quLeftSDList.remove(_quLeftSDList[index]);
                      });
                    }
                  },
                ),
              ]
            );
          },
        ),
    );
  }
  Widget _viewItem(X,text){
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: QuColors.white,
        border: Border(
          bottom: BorderSide(
            color: QuColors.divider,
            width: 0.5*X
          )
        ),
      ),
      height: 50*X,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 14*X),
        child: Text(text,style: TextStyle(
          color: QuColors.fontLightColorX,
          fontSize: 14*X
        ),
      ),
    );
  }
}

class QuLeftSDModel {
  String msgUuid;
  String message;
  QuLeftSDModel(
      {
        this.msgUuid,
        this.message,
      });

  QuLeftSDModel.fromJson(Map<String, dynamic> json) {
    msgUuid = json['msg_uuid'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg_uuid'] = this.msgUuid;
    data['message'] = this.message;
    return data;
  }
}