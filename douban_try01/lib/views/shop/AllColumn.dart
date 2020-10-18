import 'package:douban_try01/constant/ImageMessage.dart';
import 'package:douban_try01/views/group/group_page.dart';
import 'package:flutter/material.dart';
import 'package:douban_try01/widgets/SizeFit_Rpx.dart';


void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SideListViewMenu(),
    );
  }
}

class SideListViewMenu extends StatefulWidget {
  @override
  _SideListViewMenuState createState() => _SideListViewMenuState();
}

class _SideListViewMenuState extends State<SideListViewMenu> {

  var _menuStr = [];
  int _selectedIdx = 0;
  final _menuHeight = 60.0;
  final _menuWidth = 100.0;
  List <String>images=[];
  List  <String>subtitle=[];
  List  <String>price=[];
  bool sign=false;
  @override
  void initState() {

    _menuStr = new List<String>.generate(20, (i) => "menu $i");
    ImageMessage_src_title_one.getImage().then((result){
      setState(() {
        print(result.length~/3);
        images.addAll(result.sublist(0,result.length~/3));
        subtitle.addAll(result.sublist(result.length~/3,2*result.length~/3));
        price.addAll(result.sublist(2*result.length~/3));
        sign=true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding:  EdgeInsets.fromLTRB(SizeFit.setRpx(160),0,0,0),
          child: Text("全部种类",style: TextStyle(
            color: Colors.grey
          ),),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.grey,),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        ),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: _menuWidth,
            child: ListView.builder(
              itemCount: _menuStr.length,
              itemBuilder: (context, index) {
                String str = _menuStr[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIdx = index;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _menuHeight,
                        color: (_selectedIdx == index)
                            ? Colors.white
                            : Color.fromRGBO(240,240,240,1),
                        child: Center(
                                child: Text(str),
                            )
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
         Expanded(
           child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,8,8,0),
                                child: Container(
                                  width: SizeFit.setRpx(200),
                                  height: SizeFit.setRpx(200),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                      image: DecorationImage(
                                          image: NetworkImage(sign==false?"https://img3.doubanio.com/dae/niffler/niffler/images/b46af582-f7fc-11ea-a7bc-fe19c14d7590.jpg":images[index+_selectedIdx%4*10]),
                                          fit: BoxFit.fill
                                      ),
                                    color: Colors.grey
                                  ),
                                ),
                              ),
                              Container(
                                height:SizeFit.setRpx(200),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(sign==false?"title$index":subtitle[index+_selectedIdx%4*10],style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                      ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      width: SizeFit.setRpx(250),
                                    ),
                                    Text(sign==false?"价格":price[index+_selectedIdx%4*10],style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(241,150,103,20)
                                    ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                              ),
                            ],

                          ),
                          Divider(
                            color: Colors.grey,
                            height: 10.0,
                            indent: 8.0,
                            endIndent: 8.0,
                          )
                        ],
                      );

                    }
                ),
         )
          ,
        ],
      ),
    );
  }
}
