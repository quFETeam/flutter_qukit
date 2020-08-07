import 'package:flutter/material.dart';
import 'qy_appbar.dart';
import '../src/qu_skeleton.dart';
/*
本篇介绍的是 骨架屏使用，
* */
class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: QYAppBar(
        title: 'QuSkeleton',
      ), preferredSize: Size.fromHeight(44)),
      body: Column(
        children: <Widget>[
          SampleSkeletonItem(),//有动画
          SampleSkeletonItem(//无动画
            animation:false
          )
        ],
      ),
    );
  }
}

/// 简单列表项
class SampleSkeletonItem extends StatelessWidget {
  final bool animation;

  const SampleSkeletonItem({
    Key key,
    this.animation=true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            QuSkeleton(
              width: 100,
              height: 100,
              active: animation,
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              QuSkeleton(
                                width: 120.0,
                                height: 15.0,
                                active: animation,
                              ),
                              QuSkeleton(
                                width: 60.0,
                                height: 10.0,
                                active: animation,
                                margin:EdgeInsets.only(top: 8.0),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          QuSkeleton(
                              active: animation,
                              height: 10.0
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          QuSkeleton(
                              active: animation,
                              height: 10.0
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          QuSkeleton(
                            active: animation,
                            height: 10.0,
                            width: 150.0,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}