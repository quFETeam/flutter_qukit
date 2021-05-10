import 'package:flutter/material.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_button.dart';
import '../src/qu_page_route.dart';
import '../util/qu_screen.dart';
import '../src/qu_gaussian_blur.dart';
/*
* 本页介绍的跳转路由的动画效果
* */

class QuPageRouteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        title: 'QuPageRouteExample',
        body:ListView(
          padding: EdgeInsets.all(14*X),
          children: <Widget>[
            QuButton(
              text: 'CirclePage',
              onTap: (){
                Navigator.of(context).push(CirclePageRoute(builder: (context) {
                  return CirclePage();
                }));
              },
            ),
            SizedBox(
              height: 14*X,
              width: double.maxFinite,
            ),
            Container(
              width: double.maxFinite,
              height: 128*X,
              child: InkWell(
                child: Hero(
                  tag: 'imgHero',
                  child: Image.asset(
                    'lib/images/wuming_cross1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => NewPage(),
                      settings: RouteSettings(),//渐变的动画
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}

class CirclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuScaffold(
      title: 'CirclePage',
      body: QuCoverBlur(
        doubleRadius: 1,
        imgW: double.maxFinite,
        imgH: double.maxFinite,
        topWidget: Text('CirclePage'),
        image: AssetImage('lib/images/wuming_vertical6.jpg'),
      ),
    );
  }
}
class NewPage extends StatelessWidget {
  const NewPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Container(
            width:double.maxFinite,
            height: 300,
            child: GestureDetector(
              child: Hero(
                tag: 'imgHero',
                child: Image.asset(
                  'lib/images/wuming_cross1.png',
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
