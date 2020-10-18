import 'package:douban_try01/views/group/group_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:douban_try01/widgets/SizeFit_Rpx.dart';
import 'package:douban_try01/views/shop/View_two.dart';
import 'package:douban_try01/views/shop/Iconindividuality.dart';
import 'package:douban_try01/constant/constant.dart';
import 'package:douban_try01/constant/ImageMessage.dart';
bool _closed = false;
bool _isShow = true;
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: ShopPageHome(),
    );
  }
}




class ShopPageHome extends StatefulWidget {
  ShopPageHome({Key key}) : super(key: key);

  @override
  _ShopPageHomeState createState() => _ShopPageHomeState();
}

class _ShopPageHomeState extends State<ShopPageHome> {
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    tabs: <Widget>[
                      Tab(text: "豆瓣豆品"),
                      Tab(text: "豆瓣时间"),
                    ],
                    labelColor: Colors.lightGreen,
                    unselectedLabelColor:Colors.grey,
                    labelStyle: TextStyle(
                      fontWeight:FontWeight.w800,
                      fontSize: 15
                    ),
                      indicatorColor: Color.fromRGBO(122,209,135,1),
                      indicatorSize:TabBarIndicatorSize.label,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.white,

          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  doupin_swipers(),
                  SizedBox(height: 10,),
                  IconRow(),
                  SizedBox(height: 5,),
                  Container(
                    child: SizedBox(height: 20,),
                    color: Color.fromRGBO(235,235,235,1),
                  ),
                  SizedBox(height: 10,),
                  buildRowText(
                    Text("新品首发",style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    ) ,
                    ),
                  ),
                  newCommodity(),
                ],
              ),
              ListView(
                children: <Widget>[
                  MyHomePage_two(),
                  SizedBox(height: 20,),
                  Time_IconRow(),
                  SizedBox(height: 15,),
                  Container(
                    child: SizedBox(
                      height: 20,
                    ),
                    color: Color.fromRGBO(235,235,235,1),
                  ),
                  SizedBox(height: 15,),
                  Book_detail(image: 'assets/images/group_2.jpg',
                    title: "新品尝鲜：从《教父》看美国黑帮史",
                    datail: "美国故事的背面--黑帮电影中的社会、文化与历史",
                    host: "李洋",
                    subtitle: "通过39部经典黑帮题材影视剧，带你了解一个亚文化符号背后的社会、历史与文化",
                    price: 99.00,
                  ),
                  SizedBox(height: 20,),
                  Rowlistview(),
                  SizedBox(height: 20,),
                  Image_Recommend(),
                  SizedBox(height: 50,),
                ],
              ),

            ],
          ),
          backgroundColor: Color.fromRGBO(254,254,254,1),
        ),
      ),
    );
  }


}
class doupin_swipers extends StatefulWidget {
  @override
  doupin_swipersState createState() => doupin_swipersState();
}

class doupin_swipersState extends State<doupin_swipers> {
  // 声明一个list，存放image Widget
  List <Container>imgs = [];
  bool sign_swiper =false;
  @override
  void initState() {
    // TODO: implement initState
    doupin_Image_Message.getImage().then((result){
      setState(() {
        imgs.clear();
        imgs.addAll(result);
        sign_swiper=true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return firstSwiperView();
  }

  ///实现android中ViewPager轮播的效果
  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Swiper(
        key: UniqueKey(),
        itemCount: sign_swiper==true?imgs.length:0,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 10),
          builder: DotSwiperPaginationBuilder(
              color: Colors.black54, activeColor: Colors.white),
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        //是否自动播放
        onTap: (index) => print('您点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imgs[index]);
  }
}
class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconIndividuality(icons: Icon(Icons.account_balance_wallet,
            color: Colors.white,size: 30,
        ),
          texts: Text("豆瓣经典",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),

          ),
          color: Color.fromRGBO(247,125,145,1),
    ),
        IconIndividuality(icons: Icon(Icons.local_cafe,color: Colors.white,size: 30,),
          texts: Text("家居生活",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
          color: Colors.blue,
        ),
        IconIndividuality(icons: Icon(Icons.https,color:Colors.white,size: 30,),
          texts: Text("外出旅行",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(252,179,51,20),
        ),
        IconIndividuality(icons: Icon(Icons.assignment_ind,color:Colors.white,size: 30,),
          texts: Text("文具小屋",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(183,139,214, 20),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

// ignore: must_be_immutable

class newCommodity extends StatefulWidget {
  @override
  _newCommodityState createState() => _newCommodityState();
}

class _newCommodityState extends State<newCommodity> {
  List <String>images=[];
  List  <String>subtitle=[];
  List  <String>price=[];
  List <String> title=[];
  bool sign=false;
  @override
  void initState() {

    ImageMessage_doupin_src_title_one.getImage().then((result){
      setState(() {
        print(result.length~/3);
        images.addAll(result.sublist(0,result.length~/4));
        title.addAll(result.sublist(result.length~/4,2*result.length~/4));
        subtitle.addAll(result.sublist(2*result.length~/4,3*result.length~/4));
        price.addAll(result.sublist(3*result.length~/4));
        sign=true;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return buildcommodity();
  }

  Column buildcommodity() {
    List<Widget> commodity=[];
    for(int index=0;index<images.length;index++)
      {
        commodity.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(sign==false?"https://img3.doubanio.com/dae/niffler/niffler/images/b46af582-f7fc-11ea-a7bc-fe19c14d7590.jpg":images[index],
                fit: BoxFit.fill,),
              padding:EdgeInsets.fromLTRB(15, 10, 15, 2) ,
              height: 240,
              width:  SizeFit.setRpx(750),
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildRowText(Text(sign==false?"商品名称":title[index],style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ) ,
                    ),),
                    buildRowText(Text(sign==false?"商品简介":subtitle[index],style:TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Color.fromRGBO(0, 0, 0, 180)
                    ) ,
                    ),),
                  ],
                ),
                Spacer(),
                buildRowText(Text(sign==false?"99元":price[index],style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.lightGreen
                ) ,
                ),),
                SizedBox(width: SizeFit.setRpx(20),)
              ],
            ),
            SizedBox(height: 20,)
          ],
        ));
      }
    return Column(
      children: commodity,
    );
  }
}



Row buildRowText(Text text) {
  return Row(
    children: [
      SizedBox(
        width: 15,
      ),
      text
    ],
  );
}

