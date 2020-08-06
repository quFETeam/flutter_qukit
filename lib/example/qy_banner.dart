import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../util/qu_screen.dart';
import '../global/qy_colors.dart';
import 'qy_appbar.dart';

/*
本篇用到的插件 flutter_swiper: ^1.1.6 和 photo_view: ^0.9.2
* */
class QYBanner extends StatelessWidget {
  final List imgList = [
    'lib/images/wuming_02.png',
    'lib/images/wuming_03.png',
    'lib/images/wuming_04.png',
    'lib/images/wuming_05.png',
  ];
  @override
  Widget build(BuildContext context) {
    double X  = QuScreen.X(context);
   return Scaffold(
     backgroundColor: QYColors.backgroundColor,
      appBar: PreferredSize(
          child: QYAppBar(
            title: 'QYBanner',
          ), preferredSize: Size.fromHeight(44)),
      body:Column(
        children: <Widget>[
          SizedBox(
            width: double.maxFinite,
            height: 10*X,
          ),
          Protagonist(
            imgList: imgList,
            bannerHeight: 198*X,
            bannerWidth: double.maxFinite,
            shadowColor: QYColors.backgroundColor,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 10*X,
          ),
          Protagonist(
            imgList: imgList,
            bannerHeight: 198*X,
            bannerWidth: double.maxFinite,
            shadowColor: QYColors.backgroundColor,
            isShowThreeImg: true,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 10*X,
          ),
          Protagonist(
            imgList: imgList,
            bannerHeight: 198*X,
            bannerWidth: double.maxFinite,
            shadowColor: QYColors.theme,
            isShowThreeImg: true,
            bannerRadius: 5,
          ),
        ],
      ),
    );
  }
}



class Protagonist extends StatelessWidget {
  final List imgList;
  final double bannerWidth;
  final double bannerHeight;
  final double bannerRadius;
  final bool isShowThreeImg;
  final Color shadowColor;
  Protagonist({Key key,
    this.imgList,
    this.bannerHeight,
    this.bannerWidth,
    this.bannerRadius=0,
    this.isShowThreeImg=false,
    this.shadowColor,
  }) : super(key: key);
  Widget _bannerItem(index,context){
    PageController pageController =PageController(initialPage:index);
    return InkWell(
        onTap: () {
          Navigator.of(context).push(new FadeRoute(
              page: PhotoViewDetail(
                images:imgList, //传入图片list
                index: index, //传入当前点击的图片的index
                heroTag: imgList[index], //传入当前点击的图片的hero tag （可选）
                pageController: pageController,
              )));
        },
        child:ClipRRect(
          borderRadius: BorderRadius.circular(bannerRadius),
          child:Image.asset(imgList[index], fit: BoxFit.cover),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    if(imgList.length>0){
      return Container(
        width: bannerWidth*X, height:bannerHeight*X,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return  Container(
              margin:EdgeInsets.only(bottom: 2*X,top: 2*X) ,
              decoration: BoxDecoration(
                  boxShadow:[BoxShadow(
                      offset: Offset(0,4),//阴影的偏移量
                      blurRadius:1.0,//阴影的模糊程度 扩散程度
                      spreadRadius:1.0,//阴影的大小
                      color:shadowColor
                  )]
              ),
              child: _bannerItem(index,context),
            );
          },
          viewportFraction:isShowThreeImg? 0.8:1.0,//图片的宽
          scale: isShowThreeImg? 0.9:1.0,//两个图片之间的间距
          itemCount: imgList.length,
//            control: new SwiperControl(),在两侧 会出现标记
          autoplay: true, //自动播放
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  size: 7,
                  space: 4,
                  color: QYColors.grey,
                  activeSize: 7,
                  activeColor:QYColors.white
              )
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page}) : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) => page,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}

class PhotoViewDetail extends StatefulWidget {
  final List images;
  final int index ;
  final String heroTag;
  final PageController pageController;
  PhotoViewDetail(
      {Key key,
        @required
        this.images,
        this.index,
        this.heroTag,
        this.pageController,
      })
      : super(key: key);

  @override
  _PhotoViewDetailState createState() => _PhotoViewDetailState();
}

class _PhotoViewDetailState extends State<PhotoViewDetail> {
  static int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.index;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider:AssetImage(widget.images[index]),
                      heroAttributes: widget.heroTag.isNotEmpty
                          ? PhotoViewHeroAttributes(tag: widget.heroTag)
                          : null,
                    );
                  },
                  itemCount: widget.images.length,
                  loadingChild: Container(),
                  backgroundDecoration: null,
                  pageController: widget.pageController,
                  enableRotation: true,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
          ),
          Positioned(
            //图片index显示
            top: MediaQuery.of(context).padding.top + 15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("${currentIndex + 1}/${widget.images.length}",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Positioned(
            //右上角关闭按钮
            right: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
