import 'package:douban_try01/constant/constant.dart';
import 'package:douban_try01/model/subject.dart';
import 'package:douban_try01/model/top_item_bean.dart';
import 'package:douban_try01/widgets/item_count_title.dart';
import 'package:douban_try01/views/movie/title_widget.dart';
//import 'package:douban_try01/repository/movie_repository.dart';
import 'package:douban_try01/views/movie/hot_soon_tab_bar.dart';
import 'package:douban_try01/application.dart';
import 'package:douban_try01/widgets/subject_mark_image_widget.dart';
import 'package:douban_try01/widgets/rating_bar.dart';
import 'package:douban_try01/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:douban_try01/data.dart';
import 'dart:math' as math;

typedef OnTab = void Function();
// 电影页面
class MoviePage extends StatefulWidget{
  MoviePage({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() => _MoviePageState();
}
// 电影页面
class _MoviePageState extends State<MoviePage> with AutomaticKeepAliveClientMixin {
  Widget titleWidget, hotSoonTabBarPadding;
  HotSoonTabBar hotSoonTabBar;
  List<Subject> hotShowBeans = List(); //影院热映
  List<Subject> comingSoonBeans = List(); //即将上映
  List<Subject> hotBeans = List(); //豆瓣榜单
  List<SubjectEntity> weeklyBeans = List(); //一周口碑电影榜
  List<Subject> top250Beans = List(); //Top250
  var hotChildAspectRatio;
  var comingSoonChildAspectRatio;
  int selectIndex = 0; //选中的是热映、即将上映
  var itemW;
  var imgSize;
  var todayUrls = "assets/images/today.png";
  TopItemBean weeklyTopBean, weeklyHotBean, weeklyTop250Bean;
  Color weeklyTopColor, weeklyHotColor, weeklyTop250Color;
  Color todayPlayBg = Color.fromARGB(255, 160, 82, 45);

  // 页面保存在内存中不销毁
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('init movie_page');
    titleWidget = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TitleWidget(),
    );
    hotSoonTabBar = HotSoonTabBar(
        onTabCallBack: (index) {
          setState(() {
            selectIndex = index;
          });
        }
    );
    hotSoonTabBarPadding = Padding(
      padding: EdgeInsets.only(left:0,top: 35.0, bottom: 15.0),
      child: hotSoonTabBar,
    );
  //  requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    print('build movie_page');
    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery
          .of(context)
          .size
          .width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (397.0 / 670.0);
      comingSoonChildAspectRatio = (397.0 / 642.0);
    }
    return Stack(
      children: <Widget>[
        // 主体内容
        containerBody(),
        // 正在加载页面，加载内容时会覆盖页面
//        Offstage(
//          offstage: !loading,
//        ),
      ],
    );
  }

  Widget containerBody() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          // 标题
          SliverToBoxAdapter(
            child: titleWidget,
          ),

          // 今日播放电影
          SliverToBoxAdapter(
            child: Padding(
              child:_todayPlayMovie(),
              padding: EdgeInsets.only(top: 22.0),
            ),
          ),
          SliverToBoxAdapter(
            child:Container(
              margin: EdgeInsets.only(top: 35,bottom: 0),
              height: 10,
              color: Color.fromARGB(255, 234, 233, 234),
            ),
          ),
          SliverToBoxAdapter(
            child:Container(
              margin: EdgeInsets.fromLTRB(5, 26, 5, 8),
              padding: EdgeInsets.all(0),
              child: Row(
            children: <Widget>[
                Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.fromLTRB(0, 0, 5, 8),
                   child: Text('影院热映',
                   style: TextStyle(
                  fontSize:20,color:Colors.black,fontWeight:FontWeight.bold
              ),),
          ),

                 Expanded(child: SizedBox()),
                 Text(
        '全部 6 >',
        style: TextStyle(
            fontSize:12,color:Colors.grey,fontWeight:FontWeight.bold
        ),
      ),
      ],
    ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: _getRatio(),
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _getHotMoiveItem(index);
              },
              childCount: comingsooninfo.length,
            ),
          ),
      SliverToBoxAdapter(
          child:Container(
            margin: EdgeInsets.only(top: 20),
            height: 10,
            color: Color.fromARGB(255, 234, 233, 234),
          ),
      ),
          SliverToBoxAdapter(
            child:Container(
                child: Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
                child: ItemCountTitle(
                  ' 豆瓣热门',
                  fontSize: 20.0,
              //    count: hotBeans == null ? 0 : hotBeans.length,
                ),
              ),
            )
          ),


          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: _getRatio(),
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  height: 500,
                  padding: EdgeInsets.fromLTRB(4, 2, 4, 0),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          child: Container(
                            child: Image.asset(
                              hotmovieinfo[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:5.0, bottom:2.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              hotmovieinfo[index]["title"],
                              // 是否多行显示
                              softWrap: false,
                              // 多出的文本渐隐
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                );


              },
              childCount: hotmovieinfo.length,
            ),
          ),
          SliverToBoxAdapter(
            child:Container(
              margin: EdgeInsets.only(top: 6),
              height: 10,
              color: Color.fromARGB(255, 234, 233, 234),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 26.0, bottom: 16.0),
              child: ItemCountTitle(
                '  豆瓣榜单',
                count: weeklyBeans == null ? 10 : weeklyBeans.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(0),
              height: imgSize,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      width: 280,
                      height: 280,
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: new AssetImage(
                          'assets/images/ic_movie.png',
                        ),
                      )
                  )
              ),
                  Container(
                      width: 280,
                      height: 280,
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: new AssetImage(
                              'assets/images/ic_movie01.png',
                            ),
                          )
                      )
                  ),
                  Container(
                      width: 280,
                      height: 280,
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: new AssetImage(
                              'assets/images/ic_movie02.png',
                            ),
                          )
                      )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getRatio() {
      return hotChildAspectRatio;
  }


//  MovieRepository repository = MovieRepository();
     bool loading = true;
//
//  void requestAPI() async {
//    Future(() => (repository.requestAPI())).then((value) {
//      hotShowBeans = value.hotShowBeans;
//      comingSoonBeans = value.comingSoonBeans;
//      hotBeans = value.hotBeans;
//      weeklyBeans = value.weeklyBeans;
//      top250Beans = value.top250Beans;
//      todayUrls = value.todayUrls;
//      weeklyTopBean = value.weeklyTopBean;
//      weeklyHotBean = value.weeklyHotBean;
//      weeklyTop250Bean = value.weeklyTop250Bean;
//      weeklyTopColor = value.weeklyTopColor;
//      weeklyHotColor = value.weeklyHotColor;
//      weeklyTop250Color = value.weeklyTop250Color;
//      todayPlayBg = value.todayPlayBg;
//      hotSoonTabBar.setCount(hotShowBeans);
//      hotSoonTabBar.setComingSoon(comingSoonBeans);
////      hotTitle.setCount(hotBeans.length);
////      topTitle.setCount(weeklyBeans.length);
//      setState(() {
//        loading = false;
//      });
//    });
//  }

  Widget _todayPlayMovie(){
    return Stack(
      // 元素次第向左向右位移1
   //   alignment: AlignmentDirectional(1.0,1.0),
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            // 矩形框背景
            Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: todayPlayBg,// == null ? Color.fromARGB(255, 47, 22, 74) : todayPlayBg,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
            ),
            Container(
              height: 120.0,
              margin: EdgeInsets.only(left: 8.0,bottom: 14.0),
              child: Row(
                children: <Widget>[
//                  Stack(
//                    alignment: Alignment.centerLeft,
//                    children: <Widget>[
//                      LaminatedImage(urls: todayUrls, w: 90.0),
                      Positioned(
                        left: 6.0,
                        top: 10.0,
                        child: Image.asset(
                          'assets/images/today.png',
                          width: 170.0,
                          height: 115.0,
                        ),
                      ),
                   // ],
//                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0.0,left:15.0,right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '今日可播放电影已更新',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: Text(
                              '全部 15 > ',
                              style:
                              TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,top: 100),
              child: Image.asset(
                'assets/images/sofa.png',
                width: 15.0,
                height: 15.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 100, 10, 10),
              child: Text(
                '看电影',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
  // 影院热映
  Widget _getHotMoiveItem(int index){
    return Container(
      height: 500,
      padding: EdgeInsets.fromLTRB(4, 2, 4, 0),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Container(
                child: SubjectMarkImageWidget(
                  comingsooninfo[index]["image"],
                  width: itemW,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            Padding(
              padding: EdgeInsets.only(top:5.0, bottom:2.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  comingsooninfo[index]["title"],
                  // 是否多行显示
                  softWrap: false,
                  // 多出的文本渐隐
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 3.0,
                  right: 3.0,
                ),
                child: Text(
                  comingsooninfo[index]["date"],
                  style: TextStyle(
                      fontSize: 7.0, color: Colors.blueGrey),
                ),
              ),
            ),
          ]
      ),
    );
  }
  //影院热映item
  Widget _getHotMovieItem(Subject hotMovieBean, var itemW) {
    if (hotMovieBean == null) {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(
            context, '${Routes.detailPage}?subjectId=${hotMovieBean.id}');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            SubjectMarkImageWidget(
              hotMovieBean.images.large,
              width: itemW,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  hotMovieBean.title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            RatingBar(
              hotMovieBean.rating.average,
              size: 12.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget getCommonSliverGrid(List<Subject> hotBeans) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return _getHotMovieItem(hotBeans[index], itemW);
        },
        childCount: math.min(hotBeans.length, 6),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: hotChildAspectRatio
      ),
    );
  }
}
