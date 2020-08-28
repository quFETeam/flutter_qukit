import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterqukit/constants/qu_colors.dart';
import '../src/qu_gaussian_blur.dart';
import '../util/qu_screen.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_button.dart';

class QuGaussianBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
      title: 'QuGaussianBlur',
      bottomColor: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'lib/images/wuming_vertical2.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 220*X,left: 37.5*X,
            child: QuBlurRect(
              width: 300*X,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Catchphrase',
                    style: TextStyle(
                      fontSize: 16*X,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                          'He who seize the right moment, is the right man. '
                          'Victory won‘t come to me unless I go to it.'
                          'A strong man will struggle with the storms of fate.'
                          'The shortest way to do many things is to only one thing at a time.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 150),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                QuBlurOval(
                  widget: IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return BlurImagePage();
                      }));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: QuBlurOval(
                    widget:
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                QuBlurOval(
                  widget:
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlurImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 375 * X,
            height: 50 * X,
          ),
          QuCoverBlur(
              sigma:8,
              bottomWidget: Container(
                width: double.maxFinite,
                height: 200 * X,
                margin: EdgeInsets.symmetric(horizontal: 14),
                child: Image.asset(
                  'lib/images/wuming_cross1.png',
                  fit: BoxFit.cover,
                ),
              ),
              topWidget: QuButton(
                primaryColor: QuColors.theme,
                width: 100*X,height: 30*X,
                text: '充值查看',
                textSize: 14*X,
                onTap: (){
                  print('查看原图');
                },
              )),
          SizedBox(
            width: 375 * X,
            height: 50 * X,
          ),

        ],
      ),
    );
  }
}
