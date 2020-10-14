import 'package:douban_try01/views/group/group_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:douban_try01/widgets/SizeFit_Rpx.dart';
import 'package:douban_try01/views/shop/View_two.dart';
import 'package:douban_try01/views/shop/Iconindividuality.dart';
import 'package:douban_try01/constant/constant.dart';
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
    return DefaultTabController(
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
                MineFriends(),
               SizedBox(height: 10
                 ,),
               IconRow(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: SizedBox(
                    height: 20,
                  ),
                  color: Color.fromRGBO(235,235,235,1),
                ),
                SizedBox(
                  height: 10,
                ),
                buildRowText(Text("新品首发",style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ) ,
                ),),
                newCommodity(),
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
                Image_Recommend(),
                SizedBox(height: 50,),
              ],
            ),

          ],
        ),
        backgroundColor: Color.fromRGBO(254,254,254,1),
      ),
    );
  }


}
class MineFriends extends StatefulWidget {
  @override
  MineFriendsState createState() => MineFriendsState();
}

class MineFriendsState extends State<MineFriends> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    // TODO: implement initState
    imageList.add(Image.network(
      'https://pics1.baidu.com/feed/08f790529822720e6aa6f6410a5a4d43f31fabb3.jpeg?token=8fb7f32253df1531c46bfa67fe21cc75&s=EC836E99524B10E7113DF0C1030070D0',
      fit: BoxFit.fill,
    ));
    imageList.add(Image.network(
      'https://pics7.baidu.com/feed/9213b07eca80653884f4b8bfe74ce641ac348292.jpeg?token=f1c223af398963687fc1d41ca058526b&s=5A25A944114213E7D66D0917030040C9',
      fit: BoxFit.fill,
    ));
    imageList.add(Image.network(
      'https://pics4.baidu.com/feed/3b87e950352ac65caf49b4788863f51492138a80.jpeg?token=a7dd7eb878a6fbb92255c263cac17547&s=6BA00D89440B0AEF5180B9930100E081',
      fit: BoxFit.fill,
    ));
    imageList.add(Image.network(
      'https://pics7.baidu.com/feed/f11f3a292df5e0fea0f01a102ef173ad5fdf7249.jpeg?token=1908e5b736e045888160bf77893ac19e&s=EE924C83428A3EE50894C09303004093',
      fit: BoxFit.fill,
    ));
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
      height: 200,
      child: Swiper(
        itemCount: 4,
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
    return (imageList[index]);
  }
}
class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconIndividuality(icons: Icon(Icons.account_balance_wallet,
            color: Color.fromRGBO(67,135,60,20),
        ),
          texts: Text("豆瓣经典",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
    ),
        IconIndividuality(icons: Icon(Icons.local_cafe,color: Color.fromRGBO(67,135,60,20)),
          texts: Text("家居生活",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
        ),
        IconIndividuality(icons: Icon(Icons.https,color: Color.fromRGBO(67,135,60,20)),
          texts: Text("外出旅行",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
        ),
        IconIndividuality(icons: Icon(Icons.assignment_ind,color: Color.fromRGBO(67,135,60,20)),
          texts: Text("文具小屋",style: TextStyle(
            color: Color.fromRGBO(67,135,60,1),
            fontSize: 15,
          ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

// ignore: must_be_immutable

class newCommodity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          child: Image.asset('assets/images/shop_book.jpg',fit: BoxFit.fill,),
          padding:EdgeInsets.fromLTRB(15, 10, 15, 10) ,
          height: 240,
          width:  SizeFit.setRpx(750),
        ),
        buildRowText(Text("商品名称",style:TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ) ,
        ),),
        buildRowText(Text("商品简介",style:TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
        ) ,
        ),),
      ],
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

