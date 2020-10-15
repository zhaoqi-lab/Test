import 'package:douban_try01/application.dart';
import 'package:douban_try01/routers/routers.dart';
import 'package:douban_try01/views/detail/detail_page.dart';
import 'package:flutter/material.dart';

typedef TapCallback = void Function();
class TitleWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0,2),
      child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _TextImgWidget(
          '找电影',
          'assets/images/find_movie.png',
          tapCallback: () {
            print('点击找电影');
            Application.router.navigateTo(context, '${Routes.searchPage}?searchHintContent=${Uri.encodeComponent('找电影')}');
          },
        ),
        _TextImgWidget(
          '豆瓣榜单',
          'assets/images/douban_top.png',
          tapCallback: () {
            print('点击豆瓣榜单');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DouBanListView();
            }));
          },
        ),
        _TextImgWidget(
          '豆瓣猜',
          'assets/images/douban_guess.png',
          tapCallback: () {
            print('点击豆瓣猜');
            Application.router.navigateTo(context, '${Routes.searchPage}?searchHintContent=${Uri.encodeComponent('豆瓣猜')}');
          },
        ),
        _TextImgWidget(
          '豆瓣片单',
          'assets/images/douban_film_list.png',
          tapCallback: () {
            print('点击豆瓣片单');
            Application.router.navigateTo(context, '${Routes.searchPage}?searchHintContent=${Uri.encodeComponent('豆瓣片单')}');
          },
        ),
      ],
    ),
    );
  }

}
class _TextImgWidget extends StatelessWidget{
  final String text;
  final String imgAsset;
  final TapCallback tapCallback;

  _TextImgWidget(
      this.text,
      this.imgAsset,
      {Key key, this.tapCallback}
      ):super(key:key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        if (tapCallback!=null){
          tapCallback();
        }
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            imgAsset,
            width: 48,
            height: 48,
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}