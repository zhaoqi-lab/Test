import 'package:flutter/material.dart';

typedef OnClick = void Function();
///左边是豆瓣热门，右边是全部
class ItemCountTitle extends StatelessWidget{
  final count;
  final OnClick onClick;
  final String title;
  final double fontSize;

  ItemCountTitle(this.title, {Key key, this.onClick, this.count, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        if (onClick != null ){
          onClick();
        }
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: fontSize == null ? 20:fontSize,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 45, 45),
              ),
            ),
          ),
          Text(
            '全部 ${count == null ? 0 : count} > ',
            style: TextStyle(
              fontSize: 12, color: Colors.grey,),
          ),
        ],
      ),
    );
  }

}