import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../util/qu_screen.dart';
import '../src/qu_button.dart';
import '../src/qu_scaffold.dart';

/*
  按钮demo
* */
class QuList extends StatelessWidget {
  void _onTap() {
    print('点击按钮');
  }
  final items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  ScrollController  _scrollController1 = new ScrollController();
  ScrollController  _scrollController2 = new ScrollController();
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
        title: 'QuList',
        backgroundColor: QuColors.backgroundColor,
        body: ListView(
          children: <Widget>[
            Container(
                height: 100.0,
                child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController1,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          print(index);
                          _scrollController1.animateTo(index * 120.0-120,
                              duration: new Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.greenAccent,
                          width: 100.0,
                          height: 100.0,
                          child: Center(
                            child: Text(
                              '$index',
                              style: TextStyle(fontSize: 40.0),
                            ),
                          ),
                        ),
                      );
                    }
                )
            ),
            Container(
                height: 100.0,
                child: ListView.builder(
                    padding: EdgeInsets.only(right: 16*X),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController2,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          print(index);
                          _scrollController2.animateTo(69.5*index+(index-1)*96.5,
                              duration: new Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 16*X),
                          color: Colors.greenAccent,
                          width: 150.0,
                          height: 100.0,
                          child: Center(
                            child: Text(
                              '$index',
                              style: TextStyle(fontSize: 40.0),
                            ),
                          ),
                        ),
                      );
                    }
                )
            ),
          ],
        )
    );
  }
}
