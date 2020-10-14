import 'package:douban_try01/widgets/SizeFit_Rpx.dart';
import 'package:flutter/material.dart';
import 'package:douban_try01/http/Search_Rank_http.dart';
import 'package:douban_try01/widgets/star_rating.dart';
const searchList = [
  "lao-老王",
  "lao-老张",
  "xiao-小王",
  "xiao-小张",
  "test",
  "data"
];

const recentSuggest = [
  "马云-1",
  "马化腾-2",
  "xiao-小王",
  "xiao-小张",
  "test",
  "data",
  "ss"
];
int COUNT=6;
HomeRequest homeRequest = HomeRequest();
HomeRequest_today homeRequest_today=HomeRequest_today();
String titles="8";
List<MovieItem> movies = [];
List<MovieItem> movies_today = [];
main(){

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SearchBarDemo(),

    );
  }
}
class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBarDemo'),
        // 使用搜索那个放大镜图标
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              // 调用写好的方法
              showSearch(context: context,delegate: SearchBar());
            },
          )
        ],
      ),
    );
  }
}


class SearchBar extends SearchDelegate<String>{

  // 点击清楚的方法
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        // 点击把文本空的内容清空
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  // 点击箭头返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        // 使用动画效果返回
        icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,
      ),
      // 点击的时候关闭页面（上下文）
      onPressed: (){
        close(context, null);
      },
    );
  }

  // 点击搜索出现结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.pink,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  // 搜索下拉框提示的方法
  @override
  Widget buildSuggestions(BuildContext context) {
    // 定义变量 并进行判断
    final suggestionList = query.isEmpty
        ? recentSuggest
        :searchList.where((input) => input.contains(query)).toList();
    if(query.isEmpty==false)
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
          return  ListTile(
              title: RichText(
                  text: TextSpan(
                    // 获取搜索框内输入的字符串，设置它的颜色并让让加粗
                      text: suggestionList[index].substring(0,suggestionList[index].indexOf(query)),
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          //获取剩下的字符串，并让它变成灰色
                            text:  suggestionList[index].substring(suggestionList[index].indexOf(query), suggestionList[index].indexOf(query)+query.length),
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        TextSpan(
                          //获取剩下的字符串，并让它变成灰色
                            text: suggestionList[index].substring(suggestionList[index].indexOf(query)+query.length),
                            style: TextStyle(color: Colors.grey))

                      ]
                  )
              )
          );
        }
    );
    else
      return Search_detail_data();
  }
}

class Search_detail_data extends StatefulWidget {
  @override
  _Search_detail_dataState createState() => _Search_detail_dataState();
}

class _Search_detail_dataState extends State<Search_detail_data> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0,10,0,0),
                child: Container(
                  child: Text(
                    '大家都在搜',
                    style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10.0,0,0,1),
                child: SearchItemView(),
              ),
              Container(
                width: SizeFit.setRpx(750),
                child: SizedBox(
                  height: 10,
                ),
                color: Color.fromRGBO(235,235,235,1),
              ),
              real_time_book(),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchItemView extends StatefulWidget {
  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  List<String> items = [
    '面试',
    'Studio3',
    '动画dfsfds',
    '自定义View',
    '性能优化',
    'gradle',
    'Camera',
    '代码混淆 安全',
    '逆向加固'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        // runSpacing: 0,
        children: items.map((item) {
          return SearchItem(title: item);
        }).toList(),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  @required
  final String title;
  const SearchItem({Key key, this.title}) : super(key: key);
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        onTap: () {
          print(widget.title);
        },
      ),
      
    );
  }
}

class real_time_book extends StatefulWidget {
  @override
  _real_time_bookState createState() => _real_time_bookState();
}

class _real_time_bookState extends State<real_time_book> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:SizeFit.setRpx(20) ,),
        Rank_Row(Rank_title: "实施热门书影音",detail: "豆瓣榜单",),
        rank_book(),
        SizedBox(height:SizeFit.setRpx(20) ,),
        Rank_Row(Rank_title: "小组热门趋势榜",detail: "每日更新",),
        rank_book_today(),
      ],
    );
  }
}

class Rank_Row extends StatefulWidget {
  String Rank_title;
  String detail;
   Rank_Row({
    Key key,this.Rank_title,this.detail
  }) : super(key: key);

  @override
  _Rank_RowState createState() => _Rank_RowState();
}

class _Rank_RowState extends State<Rank_Row> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

         Padding(
           padding:  EdgeInsets.fromLTRB(SizeFit.setRpx(20),0,SizeFit.setRpx(20),0),
           child: Icon(Icons.trending_up,color: Colors.amberAccent,size: 25,),
         ),

        Text(widget.Rank_title,style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),),
        SizedBox(width: SizeFit.setRpx(20),),
        Text(widget.detail,style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          color: Color.fromRGBO(0, 0, 0, 200)
        ),),
        Spacer(),
        Text(
          "更多",
          style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),
        Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
        SizedBox(width: SizeFit.setRpx(20),)

      ],
    );
  }
}
class rank_book extends StatefulWidget {
  
  rank_book();
  @override
  _rank_bookState createState() => _rank_bookState();
}

class _rank_bookState extends State<rank_book> {



  @override
  void initState() {
    super.initState();

    // 请求电影列表数据
    getMovieTopList(titles);

  }

  void getMovieTopList(title) {
    homeRequest.getMovieTopList(title).then((result) {
      setState(() {
        movies.addAll(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeFit.setRpx(750),
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.spaceAround,
        // runSpacing: 0,
        children: movies.map((item) {
          if(item.rank>6)
            return Container();
          return Container(
            width: SizeFit.setRpx(325),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [

                  Text("${item.rank}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen,
                    ),
                  ),
                  SizedBox(width: SizeFit.setRpx(15),),
                  Container(
                    width: SizeFit.setRpx(80),
                    height: SizeFit.setRpx(120),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        image: DecorationImage(
                            image: NetworkImage(item.imageURL),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeFit.setRpx(15),),
                  Container(
                    height: SizeFit.setRpx(120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeFit.setRpx(180),
                          child: Text("${item.title}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 50)
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            StarRating(Rating: double.parse(item.rating),size: 15,),
                            Text("${item.rating}")
                          ],
                        ),
                        Text("电影",style: TextStyle(
                            fontSize: 14,
                            fontWeight:FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 200)
                        ),)
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class rank_book_today extends StatefulWidget {
  @override
  _rank_book_todayState createState() => _rank_book_todayState();
}

class _rank_book_todayState extends State<rank_book_today> {

  @override
  void initState() {
    super.initState();

    // 请求电影列表数据
    getMovieTopList(titles);

  }

   void getMovieTopList(title) {
    homeRequest_today.getMovieTopList(title).then((result) {
      setState(() {
        movies_today.addAll(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeFit.setRpx(750),
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.spaceAround,
        // runSpacing: 0,
        children: movies_today.map((item) {
          if(item.rank>6)
            return Container();
          return Container(
            width: SizeFit.setRpx(325),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [

                  Text("${item.rank}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen,
                    ),
                  ),
                  SizedBox(width: SizeFit.setRpx(15),),
                  Container(
                    width: SizeFit.setRpx(80),
                    height: SizeFit.setRpx(120),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        image: DecorationImage(
                            image: NetworkImage(item.imageURL),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeFit.setRpx(15),),
                  Container(
                    height: SizeFit.setRpx(120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeFit.setRpx(180),
                          child: Text("${item.title}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 50)
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            StarRating(Rating: double.parse(item.rating),size: 15,),
                            Text("${item.rating}")
                          ],
                        ),
                        Text("电影",style: TextStyle(
                            fontSize: 14,
                            fontWeight:FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 200)
                        ),)
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
