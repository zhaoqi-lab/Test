import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:douban_try01/widgets/SizeFit_Rpx.dart';
import 'package:douban_try01/views/group/search_detail.dart';
String HintText = "发现";
List <String> title=List();
List <String> detail=List();
List <String> discuss_one=List();
List <String> discuss_two=List();
void main() {

  runApp(MyApp());
}
void static_init_list()
{
  title.add("阅读马拉松组");
  title.add("豆瓣读书会");
  title.add("经典短篇阅读");
  title.add("书籍消化行动");
  detail.add("8000个阅读马拉松选手");
  detail.add("6666个书友");
  detail.add("9999个阅读者");
  detail.add("5555个消化师");
  discuss_one.add("通知|阅读马拉松活动即将完赛，欢迎各位选手回归打卡");
  discuss_two.add("文学艺术|大部头《阿加莎·克里斯蒂作品集》");
  discuss_one.add("求推荐|b站有什么不错的读书分享的up主吗");
  discuss_two.add("提问|有没有喜欢历史类书籍的书友");
  discuss_one.add("调查|做一个小小的读书调查");
  discuss_two.add("推书|《追风筝的人》");
  discuss_one.add("PK|相互激励");
  discuss_two.add("计划|打算从四月初到九月初自己读完30本书");
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: GroupPage(),
    );
  }
}

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    static_init_list();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      margin: EdgeInsets.fromLTRB(SizeFit.setRpx(25), 0, 0, 0),
                      hintText: HintText,
                      onTab: () {
                        showSearch(context: context,delegate: SearchBar());
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mail_outline,size: 28,color: Color.fromRGBO(160,160,160, 30),),
                    onPressed: () {
                      print('message');
                    },
                  ),
                ],
              ),
              Divider(
                height: 10,
                color: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(child: Listcontent())
            ],
          ),
        ));
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;

  SearchTextFieldWidget(
      {Key key, this.hintText, this.onSubmitted, this.onTab, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      // width: MediaQuery.of(context).size.width,
      width: 260.0,
      alignment: AlignmentDirectional.center,
      height: 42.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 236, 230),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: TextField(
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,11),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 192, 191, 191)),
            prefixIcon: Icon(
              Icons.search,
              size: 26,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
      ),
    );
  }
}

class Listcontent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "发现小组",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Text(
                      "更多",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      icon: Icon(Icons.keyboard_arrow_right),
                      color: Colors.grey,
                      onPressed: () {
                        print('message');
                      },
                    ),
                  ]),
                  Divider(
                    height: 0,
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Container(
                      width: SizeFit.setRpx(100),
                      height: SizeFit.setRpx(100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/group_$index.jpg'),
                          fit: BoxFit.fill
                        )
                      ),

                    ),
                    title: Padding(
                      padding:  EdgeInsets.fromLTRB(0,0,0,5),
                      child: Text(
                        title[index],
                        style: TextStyle(
                            color: Color.fromRGBO(0,0,0,75), fontWeight: FontWeight.w600),
                      ),
                    ),
                    subtitle: Text(detail[index],
                      style: TextStyle(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),),
                    trailing: Container(
                      child: OutlineButton.icon(
                        onLongPress: () {},
                        borderSide: BorderSide(color: Colors.green),
                        onPressed: null,
                        label: Text(
                          "申请",
                          style: TextStyle(color: Colors.green,
                            fontSize: 13,
                          ),
                          textScaleFactor: 1.1,
                        ),
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 20,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                     padding: new EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      ),
                      width: SizeFit.setRpx(140),
                      height: 30,
                    )
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [ Icon(Icons.chat_bubble,color: Color.fromRGBO(249,210,135, 1)),
                            SizedBox(width: 5,),
                            Text("$index",style: TextStyle(color: Color.fromRGBO(166,166,166,1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),overflow: TextOverflow.ellipsis,),
                            SizedBox(width: 24,),
                            Container(
                                child: Text(
                                    discuss_one[index],
                                    style: TextStyle(color: Color.fromRGBO(120,120,120,1),fontSize: 15,letterSpacing: 1.3 ),
                                    overflow: TextOverflow.ellipsis),
                              width: SizeFit.setRpx(470),
                            )],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [ Icon(Icons.chat_bubble,color: Color.fromRGBO(249,210,135, 1)),
                            SizedBox(width: 5,),
                            Text("$index",style: TextStyle(color: Color.fromRGBO(166,166,166,1),fontSize: 16,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis),
                            SizedBox(width: 24,),
                            Container(
                                child: Text(discuss_two[index],
                                    style: TextStyle(color: Color.fromRGBO(120,120,120,1),fontSize: 15,letterSpacing: 1.3),
                                    overflow: TextOverflow.ellipsis),
                                width: SizeFit.setRpx(470),
                            )],
                        ),
                      ],
                    ),
                    width: SizeFit.setRpx(680),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(246,246,246, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 10,
                    color: Color.fromRGBO(1, 1, 1, 150),
                    indent: 20,
                    endIndent: 20,
                  ),
                ],

              );
            },
            childCount: 4,
          ),
        )
      ],
    );
  }
}
