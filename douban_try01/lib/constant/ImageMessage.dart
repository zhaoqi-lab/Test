import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:douban_try01/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;



class ImageMessage{
  static String path=Constant.douban_time_swiper;
  static Future<List<Container>> getImage()
  async {
    String s=await rootBundle.loadString(path);
    List<String> lines = s.split('\n');
    List <Container>imgs=[];
    for(var i=0;i<lines.length-1;i++)
      {
        lines[i].replaceAll(" ", "");
        lines[i].replaceAll("\n", "");
        lines[i]=lines[i].substring(0,lines[i].length-2);
        imgs.add(new Container(
          decoration: BoxDecoration(
              borderRadius:BorderRadius.all(
                  Radius.circular(8)),
              image: DecorationImage(image: NetworkImage(lines[i]
              ),
                  fit: BoxFit.fill)
          ),

        ));
      }
    return imgs;
  }
}


class ImageMessage_src_title_one{
  static String path=Constant.douban_time_src_title_one;
  static Future<List<String>> getImage()
  async {

    String s=await rootBundle.loadString(path);
    List<String> lines = s.split('\n');
    List<String> srcs=[];
    List<String> titles=[];
    List<String> subtitles=[];
    for(var i=0;i<lines.length-1;i++)
    {
     int start_index=lines[i].indexOf(" ");
     int end_index=lines[i].lastIndexOf(" ");
     srcs.add(lines[i].substring(0,start_index));
     titles.add(lines[i].substring(start_index+1,end_index));
     subtitles.add(lines[i].substring(end_index+1));
    }
    List<String> result=[];
    result.addAll(srcs);
    result.addAll(titles);
    result.addAll(subtitles);
    return result;
  }
}

class ImageMessage_src_title_two{
  static String path=Constant.douban_time_src_title_two;
  static Future<List<String>> getImage()
  async {
    String s=await rootBundle.loadString(path);
    List<String> lines = s.split('\n');
    List<String> srcs=[];
    List<String> titles=[];
    List<String> subtitles=[];
    for(var i=0;i<lines.length-1;i++)
    {
      int start_index=lines[i].indexOf(" ");
      int end_index=lines[i].lastIndexOf(" ");
      srcs.add(lines[i].substring(0,start_index));
      titles.add(lines[i].substring(start_index+1,end_index));
      subtitles.add(lines[i].substring(end_index+1));
    }
    List<String> result=[];
    result.addAll(srcs);
    result.addAll(titles);
    result.addAll(subtitles);
    return result;
  }
}


class doupin_Image_Message{
  static String path=Constant.douban_doupin_swiper;
  static Future<List<Container>> getImage()
  async {
    String s=await rootBundle.loadString(path);
    List<String> lines = s.split('\n');
    List <Container>imgs=[];
    for(var i=0;i<lines.length-1;i++)
    {
      lines[i].replaceAll(" ", "");
      lines[i].replaceAll("\n", "");
      lines[i]=lines[i].substring(0,lines[i].length-2);
      imgs.add(new Container(
        decoration: BoxDecoration(
            borderRadius:BorderRadius.all(
                Radius.circular(8)),
            image: DecorationImage(image: NetworkImage(lines[i]
            ),
                fit: BoxFit.fill)
        ),

      ));
    }
    return imgs;
  }
}


class ImageMessage_doupin_src_title_one{
  static String path=Constant.douban_doupin_src_title_one;
  static Future<List<String>> getImage()
  async {

    String s=await rootBundle.loadString(path);
    List<String> lines = s.split('\n');
    List<String> srcs=[];
    List<String> titles=[];
    List<String> subtitles=[];
    List<String> price=[];
    for(var i=0;i<lines.length-1;i++)
    {
      int start_index=lines[i].indexOf(" ");
      int end_index=lines[i].lastIndexOf(" ");
      price.add(lines[i].substring(end_index+1));
      String line=lines[i].substring(0,end_index);
      end_index=line.lastIndexOf(" ");
      srcs.add(line.substring(0,start_index));
      titles.add(line.substring(start_index+1,end_index));
      subtitles.add(line.substring(end_index+1));
    }
    List<String> result=[];
    result.addAll(srcs);
    result.addAll(titles);
    result.addAll(subtitles);
    result.addAll(price);
    return result;
  }
}
