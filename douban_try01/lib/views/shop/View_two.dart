import 'package:douban_try01/constant/ImageMessage.dart';
import 'package:douban_try01/views/group/group_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:douban_try01/widgets/SizeFit_Rpx.dart';
import 'package:douban_try01/views/shop/Iconindividuality.dart';
class MyHomePage_two extends StatefulWidget {
  @override
  _MyHomePage_twoState createState() => _MyHomePage_twoState();
}

class _MyHomePage_twoState extends State<MyHomePage_two> {
  List <Container>imgs = [new Container(
    decoration: BoxDecoration(
        borderRadius:BorderRadius.all(
            Radius.circular(8)),
        image: DecorationImage(image: NetworkImage('https://pics1.baidu.com/feed/08f790529822720e6aa6f6410a5a4d43f31fabb3.jpeg?token=8fb7f32253df1531c46bfa67fe21cc75&s=EC836E99524B10E7113DF0C1030070D0',
        ),
            fit: BoxFit.fill)
    ),

  )];
  bool sign_swiper =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ImageMessage.getImage().then((result){
      setState(() {
        imgs.clear();
        imgs.addAll(result);
        sign_swiper=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          Container(
            height: 190,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return imgs[index];
              },
              itemCount: sign_swiper==true?imgs.length:1,
              autoplay: true,
              pagination: SwiperPagination(),
              control:  SwiperControl(iconPrevious: null,
                  iconNext: null),
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),

        ],
      ),
    );
  }
}

class Time_IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconIndividuality(icons: Icon(Icons.school,
          color: Colors.white,
          size:32
        ),
          texts: Text("青椒学院",style: TextStyle(
            color: Color.fromRGBO(0,0,0,75),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(247,125,145,1),
        ),
        IconIndividuality(icons: Icon(Icons.add_alarm,color: Colors.white, size:32),
          texts: Text("时间发现",style: TextStyle(
            color: Color.fromRGBO(0,0,0,75),
            fontSize: 15,
          ),
          ),
          color: Colors.blue,
        ),
        IconIndividuality(icons: Icon(Icons.border_all,color: Colors.white, size:32),
          texts: Text("全部专栏",style: TextStyle(
            color: Color.fromRGBO(0,0,0,75),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(252,179,51,20),
        ),
        IconIndividuality(icons: Icon(Icons.calendar_today,color: Colors.white, size:32),
          texts: Text("签到",style: TextStyle(
            color: Color.fromRGBO(0,0,0,75),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(183,139,214, 20),
        ),
        IconIndividuality(icons: Icon(Icons.assignment_ind,color: Colors.white, size:32),
          texts: Text("我的",style: TextStyle(
            color:Color.fromRGBO(0,0,0,75),
            fontSize: 15,
          ),
          ),
          color: Color.fromRGBO(93,192,84, 20),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
class Book_detail extends StatefulWidget {
  String datail;
  String title;
  double price;
  String host;
  String subtitle;
  String image;

  Book_detail({this.title,this.datail,this.price,this.host,this.subtitle,this.image});

  @override
  _Book_detailState createState() => _Book_detailState();
}

class _Book_detailState extends State<Book_detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildtitle(),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: SizeFit.setRpx(50),),
              Container(
                width: SizeFit.setRpx(220),
                height: SizeFit.setRpx(220),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage("https://img3.doubanio.com/dae/niffler/niffler/images/b46af582-f7fc-11ea-a7bc-fe19c14d7590.jpg"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeFit.setRpx(20),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(widget.datail,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        width: SizeFit.setRpx(300),
                      ),
                      SizedBox(width:SizeFit.setRpx(20) ,),
                      Text("${widget.price}元",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(241,150,103,20)
                      ),),
                    ],
                  ),
                  SizedBox(
                    height:SizeFit.setRpx(30) ,
                  ),
                  Row(
                    children: [
                      Text("主讲人",style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0,0,0,150)
                      )),
                      SizedBox(width: SizeFit.setRpx(20),),
                      Text(widget.host,style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0,0,0,150)
                      ))
                    ],
                  ),
                  SizedBox(
                    height:SizeFit.setRpx(30) ,
                  ),
                  Container(
                    child: Text(widget.subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0,0,0,150)
                        )
                    ),
                    width: SizeFit.setRpx(400),

                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Center buildtitle() {
    return Center(
      child: Text(widget.title,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class Rowlistview extends StatefulWidget {
  @override
  _RowlistviewState createState() => _RowlistviewState();
}

class _RowlistviewState extends State<Rowlistview> {
  final double offsets=1.0;
  final Color colors=Color.fromRGBO(250, 250, 250,200);
  final double blurRadiuss= 5; //阴影模糊程度
  final double spreadRadiuss= 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeFit.setRpx(150),
        width: SizeFit.setRpx(500),
        child: ListView.builder(
            shrinkWrap: true, 								//解决无限高度问题

            scrollDirection: Axis.horizontal,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              if(index==0)
                return Row(
                  children: [
                    SizedBox(width:  SizeFit.setRpx(50),),
                    buildContainershadow(),
                    SizedBox(width:  SizeFit.setRpx(30),)
                  ],
                );
              return Row(
                children: [
                  buildContainershadow(),
                  SizedBox(width:  SizeFit.setRpx(30),)
                ],
              );
            }
        )
    );
  }
  Container buildContainershadow({String data}) {
    return Container(
      width: SizeFit.setRpx(400),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
                color: colors,
                offset: Offset(0.0, offsets), //阴影xy轴偏移量
                blurRadius: blurRadiuss, //阴影模糊程度
                spreadRadius: spreadRadiuss //阴影扩散程度
            ),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0-offsets), //阴影xy轴偏移量
                blurRadius: blurRadiuss, //阴影模糊程度
                spreadRadius: spreadRadiuss //阴影扩散程度
            ),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(offsets, 0.0), //阴影xy轴偏移量
                blurRadius: blurRadiuss, //阴影模糊程度
                spreadRadius: spreadRadiuss //阴影扩散程度
            ),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0-offsets, 0.0), //阴影xy轴偏移量
                blurRadius: blurRadiuss, //阴影模糊程度
                spreadRadius: spreadRadiuss //阴影扩散程度
            )
          ]),
      child: Row(
        children: [
          SizedBox(width: SizeFit.setRpx(20),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_circle_outline,size: 25,color: Colors.lightGreen,),
              Text("试听",style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 12
              ),)

            ],
          ),
          SizedBox(width:SizeFit.setRpx(20),),
          Container(
            width: SizeFit.setRpx(300),
            child: Text(data==null? "通过39部经典黑帮题材影视剧，带你了解一个亚文化符号背后的社会、历史与文化":data,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 90)
              ),
            ),
          )
        ],
      ),
    );
  }
}



// ignore: must_be_immutable
class Image_Recommend extends StatefulWidget {
  String title;
  List <String>images_one=[];
  List  <String>subtitle_one=[];
  List  <String>price_one=[];
  List  <String>images_two=[];
  List  <String>subtitle_two=[];
  List <String> price_two=[];
  bool sign=false;
  Image_Recommend();
  @override
  _Image_RecommendState createState() => _Image_RecommendState();
}

class _Image_RecommendState extends State<Image_Recommend> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ImageMessage_src_title_one.getImage().then((result){
      setState(() {
        print(result.length~/3);
        widget.images_one.addAll(result.sublist(0,result.length~/3));
        widget.subtitle_one.addAll(result.sublist(result.length~/3,2*result.length~/3));
        widget.price_one.addAll(result.sublist(2*result.length~/3));
      });
    });
    ImageMessage_src_title_two.getImage().then((result){
      setState(() {
        widget.images_two.addAll(result.sublist(0,result.length~/3));
        widget.subtitle_two.addAll(result.sublist(result.length~/3,2*result.length~/3));
        widget.price_two.addAll(result.sublist(2*result.length~/3));
        widget.sign=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding:  EdgeInsets.fromLTRB(SizeFit.setRpx(50),0,0,20),
          child: Container(
            child: Text('秋日特惠',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Container(
            height: SizeFit.setRpx(450),
            width: SizeFit.setRpx(750),
            child: ListView.builder(
                shrinkWrap: true, 								//解决无限高度问题

                scrollDirection: Axis.horizontal,
                itemCount: widget.sign==false?100:widget.images_one.length,
                itemBuilder: (BuildContext context, int index) {
                  if(index==0)
                    return Row(
                      children: [
                        SizedBox(width:  SizeFit.setRpx(50),),
                        Column(
                          children: [
                            Container(
                              width: SizeFit.setRpx(200),
                              height: SizeFit.setRpx(240),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.sign==false?"assets/images/group_2.jpg":widget.images_one[index]),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            SizedBox(height: 15,width: SizeFit.setRpx(200),),
                            Container(
                              width: SizeFit.setRpx(200),
                              child: Text(widget.sign==false?'正在加载':widget.subtitle_one[index],
                                maxLines: 2,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(height: 10,width: SizeFit.setRpx(200),),
                            Text("${widget.sign==false?"99":widget.price_one[index]}元",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(241,150,103,20)
                            ),),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(width:  SizeFit.setRpx(40),),

                      ],
                    );
                  return Row(
                    children: [

                      Column(
                        children: [
                          Container(
                            width: SizeFit.setRpx(200),
                            height: SizeFit.setRpx(240),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                image: DecorationImage(
                                    image: NetworkImage(widget.sign==false?"assets/images/group_2.jpg":widget.images_one[index]),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(height: 15,width: SizeFit.setRpx(200),),
                          Container(
                            width: SizeFit.setRpx(200),
                            child: Text(widget.sign==false?'正在加载':widget.subtitle_one[index],
                              maxLines: 2,
                              overflow:TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(height: 10,width: SizeFit.setRpx(200),),
                          Text("${widget.sign==false?"99":widget.price_one[index]}元",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(241,150,103,20)
                          ),),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      SizedBox(width:  SizeFit.setRpx(40),)
                    ],
                  );
                }
            )
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(SizeFit.setRpx(50),0,0,20),
          child: Container(
            child: Text('职业计划',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Container(
            height: SizeFit.setRpx(450),
            width: SizeFit.setRpx(750),
            child: ListView.builder(
                shrinkWrap: true, 								//解决无限高度问题

                scrollDirection: Axis.horizontal,
                itemCount: widget.sign==false?100:widget.images_two.length,
                itemBuilder: (BuildContext context, int index) {
                  if(index==0)
                    return Row(
                      children: [
                        SizedBox(width:  SizeFit.setRpx(50),),
                        Column(
                          children: [
                            Container(
                              width: SizeFit.setRpx(200),
                              height: SizeFit.setRpx(240),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.sign==false?"assets/images/group_2.jpg":widget.images_two[index]),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            SizedBox(height: 15,width: SizeFit.setRpx(200),),
                            Container(
                              width: SizeFit.setRpx(200),
                              child: Text(widget.sign==false?'正在加载':widget.subtitle_two[index],
                                maxLines: 2,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(height: 10,width: SizeFit.setRpx(200),),
                            Text("${widget.sign==false?"99":widget.price_two[index]}元",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(241,150,103,20)
                            ),),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(width:  SizeFit.setRpx(40),),

                      ],
                    );
                  return Row(
                    children: [

                      Column(
                        children: [
                          Container(
                            width: SizeFit.setRpx(200),
                            height: SizeFit.setRpx(240),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                image: DecorationImage(
                                    image: NetworkImage(widget.sign==false?"assets/images/group_2.jpg":widget.images_two[index]),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(height: 15,width: SizeFit.setRpx(200),),
                          Container(
                            width: SizeFit.setRpx(200),
                            child: Text(widget.sign==false?'正在加载':widget.subtitle_two[index],
                              maxLines: 2,
                              overflow:TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(height: 10,width: SizeFit.setRpx(200),),
                          Text("${widget.sign==false?"99":widget.price_two[index]}元",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(241,150,103,20)
                          ),),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      SizedBox(width:  SizeFit.setRpx(40),)
                    ],
                  );
                }
            )
        )
      ],
    );
  }
}
