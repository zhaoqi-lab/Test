import 'package:douban_try01/constant/constant.dart';
import 'package:flutter/material.dart';
typedef TabCallBack = void Function(int index);

//影院热映、即将上映 tab
class HotSoonTabBar extends StatefulWidget{
  final state = _HotSoonTabBarState();
  HotSoonTabBar({Key key, TabCallBack onTabCallBack}):super(key:key) {
    state.setTabCallBack(onTabCallBack);
  }
  @override
  State<StatefulWidget> createState() {

    return state;
  }

  void setCount(List list){
    state.setCount(list.length);
  }
  void setComingSoon(List list){
    state.setComingSoonCount(list.length);
  }

}
class _HotSoonTabBarState extends State<HotSoonTabBar> with SingleTickerProviderStateMixin{
  int movieCount = 0;
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  Widget tabBar;
  TabController _tabController;
  var hotCount,soonCount;
  TabCallBack onTabCallBack;
  int comingSoonCount = 0;
  int selectIndex = 0;

  @override
  void initState(){
    super.initState();
    selectColor = Color.fromARGB(255, 45, 45, 45);
    unselectedColor = Color.fromARGB(255, 135, 135, 135);
    selectStyle = TextStyle(
        fontSize: 20,
        color: selectColor,
        fontWeight: FontWeight.bold
    );
    unselectedStyle = TextStyle(
        fontSize: 20, color: unselectedColor
    );
    _tabController = TabController(vsync: this,length: 2);
    _tabController.addListener(listener);
    tabBar = TabBar(
      tabs: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: Constant.TAB_BOTTOM),
          child: Text('影院热映'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Constant.TAB_BOTTOM),
          child: Text('即将上映'),
        ),
      ],
      indicatorColor: selectColor,
      labelColor: selectColor,
      labelStyle: selectStyle,
      unselectedLabelColor: unselectedColor,
      unselectedLabelStyle: unselectedStyle,
      indicatorSize: TabBarIndicatorSize.label,
      controller: _tabController,
      isScrollable: true,
    );
  }
  void listener(){
    if(_tabController.indexIsChanging){
      var index = _tabController.index;
      print("HotSoonTabBar index changing=$index");
      selectIndex = index;
      setState(() {
        if (index==0){
          movieCount = hotCount;
        } else {
          movieCount = comingSoonCount;
        }
        if (onTabCallBack != null ){
          onTabCallBack(index);
        }
      });
    }
  }
  @override
  void dispose(){
    _tabController.removeListener(listener);
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.only(left: 0),
      child:Row(
        children: <Widget>[
          TabBar(
            tabs: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text('影院热映',
                    style: TextStyle(
                    fontSize:16,color:Colors.black,fontWeight:FontWeight.bold
                ),),
              ),
              SizedBox(width: 1,),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text('即将上映',
                  style: TextStyle(
                      fontSize:16,color:Colors.black,fontWeight:FontWeight.bold
                  ),),
              ),
//              Padding(
//                padding: EdgeInsets.only(bottom: Constant.TAB_BOTTOM),
//                  child: Text('影院热映'),
//              ),
//             Padding(
//                padding: EdgeInsets.only(bottom: Constant.TAB_BOTTOM),
//                 child: Text('即将上映'),
//              ),
            ],
    indicatorColor: selectColor,
    labelColor: selectColor,
    labelStyle: selectStyle,
    unselectedLabelColor: unselectedColor,
    unselectedLabelStyle: unselectedStyle,
    indicatorSize: TabBarIndicatorSize.label,
    controller: _tabController,
    isScrollable: true,
    ),
        Expanded(child: SizedBox()),
        Text(
          '全部 6 >',
          style: TextStyle(
              fontSize:12,color:Colors.black,fontWeight:FontWeight.bold
          ),
        ),
      ],
    ),
    );
  }
  ///影院热映数量
  void setCount(int count){
    setState(() {
      this.hotCount = count;
      // 若当前是热映标签，就重新渲染movieCount
      if (selectIndex==0){
        setState(() {
          movieCount = hotCount;
        });
      }
    });
  }
  ///即将上映数量
  void setComingSoonCount(int length){
    setState(() {
      this.comingSoonCount = length;
      if (selectIndex == 1){
        setState(() {
          movieCount = comingSoonCount;
        });
      }
    });
  }

  void setTabCallBack(TabCallBack onTabCallBack){
    this.onTabCallBack = onTabCallBack;
  }
}