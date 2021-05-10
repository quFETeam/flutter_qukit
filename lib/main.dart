import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './constants/qu_colors.dart';
import './util/qu_screen.dart';
import 'example/button.dart';
import 'example/qu_list.dart';
import 'example/qu_skeleton.dart';
import 'example/my_dialog.dart';
import 'example/qu_no_network.dart';
import 'example/qu_banner.dart';
import 'example/qu_sticky_list.dart';
import 'example/state.dart';
import 'example/qu_bottom_drawer.dart';
import 'example/qu_turn_page_atlas.dart';
import 'example/qu_well_received.dart';
import 'example/qu_verification_code.dart';
import 'example/qu_sand_able.dart';
import 'example/qu_bottom_sheet.dart';
import 'example/qu_gaussian_blur.dart';
import 'example/qu_flexible_text.dart';
import 'example/qu_dynamic_appbar.dart';
import 'example/qu_tab_indicator.dart';
import 'example/qu_left_sd.dart';
import 'example/qu_input_box.dart';
import 'example/qu_animation_icon.dart';
import 'example/qu_page_route.dart';

void main() {
  runApp(KitApp());
  //强制竖屏
  SystemChrome.setPreferredOrientations([
    //强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class KitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter qukit',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
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
                  image: AssetImage('lib/images/qu_logo.jpg'),
                )
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: QuColors.white.withOpacity(0.95),
            child: ListView(
              padding: EdgeInsets.only(left: 15*X,right: 15*X,top: 44*X+T),
              children: <Widget>[
                _itemView('QuButton',Button()),
                _itemView('QuSkeleton',QuSkeletonExample()),
                _itemView('QuDialog',MyDialog()),
                _itemView('QuBanner',QuBannerExample()),
//                _itemView('QuNoNetwork',QuNoNetwork1()),
                _itemView('Qustate',A()),
                _itemView('QuBottomDrawer',QuBottomDrawer()),
                _itemView('QuTurnPageAtlas',QuTurnPageAtlas()),
                _itemView('QuWellReceived',QuWellReceived()),
                _itemView('QuVerificationCode',QuVerificationCodeExample()),
                _itemView('QuSandAble',QuSandAbleExample()),
                _itemView('QuBottomSheet',QuBottomSheetExample()),
                _itemView('QuGaussianBlur',QuGaussianBlur()),
                _itemView('QuFlexibleTex',QuFlexibleTextExample()),
                _itemView('QuDynamicAppbar',QuDynamicAppbarExample()),
                _itemView('QuTabIndicator',QuTabIndicatorExample()),
                _itemView('QuLeftSD',QuLeftSDExample()),
                _itemView('QuInputBox', QuInputBoxExample()),
                _itemView('QuAnimationIcon', QuAnimationIconExample()),
                _itemView('QuPageRoute', QuPageRouteExample()),
                _itemView('QuList', QuList()),
                _itemView('QuStickyList', QuStickyList()),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.maxFinite,
            height: 44*X+T,
            color: QuColors.theme.withOpacity(0.8),
            padding: EdgeInsets.only(bottom: 10*X),
            child: Text('Flutter Qukit',style: TextStyle(
              color:QuColors.black,
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
              color: QuColors.divider,
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
              color: QuColors.grey,
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
