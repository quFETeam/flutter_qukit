import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterqukit/global/qy_colors.dart';
import 'package:flutterqukit/util/qu_screen.dart';
import 'example/button.dart';
import 'example/qy_no_network.dart';
import 'example/qy_text.dart';
import 'example/qy_banner.dart';
import 'example/state.dart';
void main() {
  runApp(KitApp());
  //强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class KitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter qukit',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: KitHomePage(),
    );
  }
}

class KitHomePage extends StatefulWidget {
  KitHomePage({Key key}) : super(key: key);
  @override
  _KitHomePageState createState() => _KitHomePageState();
}

class _KitHomePageState extends State<KitHomePage> {

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    double T = QuScreen.T(context);
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('lib/images/qy_logo.jpg'),
                )
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: QYColors.white.withOpacity(0.8),
            child: ListView(
              padding: EdgeInsets.only(left: 15*X,right: 15*X,top: 44*X+T),
              children: <Widget>[
                _itemView('QYButton',Button()),
                _itemView('QYText',QYText()),
                _itemView('QYBanner',QYBanner()),
                _itemView('QYNoNetwork',QYNoNetwork1()),
                _itemView('QYstate',A()),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.maxFinite,
            height: 44*X+T,
            color: QYColors.theme.withOpacity(0.8),
            padding: EdgeInsets.only(bottom: 10*X),
            child: Text('Flutter Qukit',style: TextStyle(
              color:QYColors.black,
              fontSize: 20*X,
              fontWeight: FontWeight.w800
            ),),
          ),
        ],
      ),
    );
  }

  Widget _itemView(String text,Widget routeName){
    double X = QuScreen.X(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => routeName,
            )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: QYColors.divider,
              width: 1
            )
          ),
        ),
        width: double.maxFinite,
        height: 50*X,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text,style: TextStyle(
              color: QYColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),),
            Container(
              height: 16*X,width: 10*X,
              child: Image.asset('lib/images/next_page.png',fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }
}
