import 'package:douban_try01/views/detail/detail_page.dart';
import '../views/home/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params){
      return HomePage();
    }
);

var detailPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      var subjectId = params['subjectId']?.first;
      //return DetailPage(subjectId: subjectId);
    }
);