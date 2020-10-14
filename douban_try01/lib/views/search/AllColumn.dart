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

  @override
  void initState() {

    _menuStr = new List<String>.generate(20, (i) => "menu $i");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(),
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
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20,8,8,0),
                            child: Container(
                              width: SizeFit.setRpx(300),
                              height: SizeFit.setRpx(300),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(""),
                                      fit: BoxFit.fill
                                  ),
                                color: Colors.grey
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text("title$index",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),),
                              Text("主讲人  $index",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),),
                              Text("价格  $index",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),)
                            ],
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
