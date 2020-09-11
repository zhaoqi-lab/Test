import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
class DetailPage extends StatelessWidget{
  final subjectId;
  DetailPage(this.subjectId,{Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text(
          'detail page'
      ),
    );
  }

}