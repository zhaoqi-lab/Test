//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:douban_try01/constant/color_constant.dart';
//import 'package:douban_try01/model/top_item_bean.dart';
//import 'package:flutter/material.dart';
//
//List bangdan = ["assets/images/ic_movie.png","assets/images/ic_movie01.png","assets/images/ic_movie02.png"];
//class TopItemWidget extends StatelessWidget{
//  final String title;
//  final TopItemBean bean;
//  final Color partColor;
////  var _imgSize;
//
//  TopItemWidget({
//    Key key,
//    @required this.title,
//    @required this.bean,
//    this.partColor = Colors.brown,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Container(
//        width: 250,
//        height: 250,
//        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(18),
//            image: DecorationImage(
//                image: new AssetImage(
//                  'assets/images/ic_movie.png',
//                ),
//            )
//        )
//    );
//  }
//
//}