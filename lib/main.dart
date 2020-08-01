import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterqukit/example/qy_appbar.dart';
import 'package:flutterqukit/global/qy_colors.dart';
import 'example/qy_button.dart';
import 'example/offline.dart';
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
    return Scaffold(
      appBar:PreferredSize(
          child: QYAppBar(
            title: 'Flutter Qukit',
            isCenterTitle: true,
            haveLeftButton: false,
            appBarColor: QYColors.theme,
          ), preferredSize: Size.fromHeight(44)),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('lib/images/wuming_01.jpeg'),
          )
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 38,right: 38),
          children: <Widget>[
            Button(
              text: 'QYButton',
              routeName: QYButton(),
            ),
            Button(
              text: 'Offline',
              routeName: Offline(),
            ),

          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Widget routeName;
  Button({Key key,
    this.text,this.routeName
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.cyan.withOpacity(0.8),
        onPressed: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => routeName,
             )
         );
      },
        child:Text(text,style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),),
    );
  }
}
