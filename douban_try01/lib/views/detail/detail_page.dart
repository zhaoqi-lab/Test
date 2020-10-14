import 'package:flutter/material.dart';
import 'package:douban_try01/data.dart';

class DouBanListView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var i_count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getListViewContainer(),
      ),
    );
  }
  getListViewContainer() {
    return ListView.builder(
      //item 的数量
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              numberWidget(index+1),
              getItemContainerView(index),
              //下面的灰色分割线
              Container(
                height: 10,
                color: Color.fromARGB(255, 234, 233, 234),
              )
            ],
          );
        });
  }

  //肖申克的救赎
  getTitleView(int index) {
    var title = topinfo[index]["title"];
    var year = topinfo[index]["year"];
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.play_circle_outline,
            color: Colors.redAccent,
          ),
          SizedBox(width: 7,),
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(width: 7,),
          Text('($year)',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey))
        ],
      ),
    );
  }

  getItemContainerView(int index) {
    //   var imgUrl = 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E9%98%BF%E7%94%98%E6%AD%A3%E4%BC%A0&step_word=&hs=0&pn=3&spn=0&di=57200&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=1670738129%2C793289343&os=2713614516%2C2200717653&simid=3149575231%2C3132362969&adpicid=0&lpn=0&ln=959&fr=&fmq=1600155331315_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fs14.sinaimg.cn%2Fmiddle%2F004jp28Bgy729ZmOrnf7d%26690&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B3g3f1q_z%26e3BvgAzdH3F%25El%25l0%25bn%25Eb%25B0%25Ab%25Em%25lc%25b0%25Ec%25A0%25lD%25EF%25BD%25b9%25E0%25B9%25Bm%25Em%25Ac%25bd%25Em%25Ab%25BB%25E0%25AB%25BB%25Em%25BE%25Bl%25E9%25BD%25BA%25E0%25b9%25bAAzdH3F&gsm=4&rpstart=0&rpnum=0&islist=&querylist=&force=undefined';
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage(
                      topinfo[index]["image"],), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
            height: 150.0,
            width: 100.0,
          ),
          //        getImage(imgUrl),
          Expanded(
            child: getMovieInfoView(index),
            flex: 1,
          )
        ],
      ),
    );
  }

//  getStaring(var stars) {
//    return Row(
//      children: <Widget>[RatingBar(stars), Text('$stars')],
//    );
//  }

  //电影标题，星标评分，演员简介Container
  getMovieInfoView(int index) {
    var start = topinfo[index]["start"];
    return Container(
      height: 150.0,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          getTitleView(index),
          RatingBar(start),
          DescWidget(index)
        ],
      ),
    );
  }

  //NO.1 图标
  numberWidget(var no) {
    return Container(
      child: Text(
        'No.$no',
        style: TextStyle(color: Color.fromARGB(255, 133, 66, 0)),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 201, 129),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.only(left: 12, top: 10),
    );

  }
}

class RatingBar extends StatelessWidget {
  double stars;

  RatingBar(this.stars);

  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    //实心星星
    var startNumber = stars ~/ 2;
    //半实心星星
    var startHalf = 0;
    if (stars.toString().contains('.')) {
      int tmp = int.parse((stars.toString().split('.')[1]));
      if (tmp >= 5) {
        startHalf = 1;
      }
    }
    //空心星星
    var startEmpty = 5 - startNumber - startHalf;

    for (var i = 0; i < startNumber; i++) {
      startList.add(Icon(
        Icons.star,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    if (startHalf > 0) {
      startList.add(Icon(
        Icons.star_half,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    for (var i = 0; i < startEmpty; i++) {
      startList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 18,
      ));
    }
    startList.add(Text(
      '$stars',
      style: TextStyle(
        color: Colors.grey,
      ),
    ));
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 5),
      child: Row(
        children: startList,
      ),
    );
  }
}

//类别、演员介绍
class DescWidget extends StatelessWidget {
  var index;
  DescWidget(this.index);
  @override
  Widget build(BuildContext context) {
    var cast = topinfo[index]["cast"];
    var sb = StringBuffer();
    var genres = topinfo[index]["genres"];
    var director = topinfo[index]["director"];
    sb.write('${cast} ');
    sb.write('${genres} ');
    sb.write("/ ");
//    List<String> list = List.generate(
//        cast.length, (int index) => '弗兰克'.toString());
    sb.write('${director} ');
//    for (var i = 0; i < list.length; i++) {
//      sb.write('${list[i]} ');
//    }
    return Container(
      child: Text(
        sb.toString(),
        softWrap: true,
        textDirection: TextDirection.ltr,
        style:
        TextStyle(fontSize: 15, color: Color.fromARGB(255, 118, 117, 118)),
      ),
    );
  }
}
