import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:douban_try01/Toast.dart';

///订阅/取消电影控件
typedef BoolCallback = void Function(bool markAdded);
class SubjectMarkImageWidget extends StatefulWidget{
  final imgNetUrl;
  final BoolCallback markAdd;
  final width;
  SubjectMarkImageWidget(this.imgNetUrl,
      {Key key, this.markAdd, this.width = 150.0})
      : super(key: key);
  var height;
  @override
  State<StatefulWidget> createState(){
    height = this.width/150.0 * 210.0;
    return _SubjectMarkImageWidgetState();
  }
}

class _SubjectMarkImageWidgetState extends State<SubjectMarkImageWidget>{
  var markAddedIcon, defaultMarkIcon;
  var imgWH = 28.0;
  var loadImg;
  var markAdded = false;
  @override
  void initState(){
    super.initState();
    markAddedIcon = Image(
      image: AssetImage('assets/images/ic_subject_mark_added.png'),
      width: imgWH,
      height: imgWH,
    );
    defaultMarkIcon = ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
      child: Image(
        image: AssetImage('assets/images/ic_subject_rating_mark_wish.png'),
        width: imgWH,
        height: imgWH,
      ),
    );
//    var defaultImg = Image.asset("assets/images/jiangziya.png");
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
    ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    child: Image(
    image: AssetImage(widget.imgNetUrl),
    width: widget.width,
    height: widget.height,
    fit:BoxFit.fill,
    ),
    ),
        GestureDetector(
            child: markAdded ? markAddedIcon:defaultMarkIcon,
            onTap: (){
              if(widget.markAdd !=null ) {
                widget.markAdd(markAdded);

              }
              setState(() {
                markAdded = !markAdded;
                if(markAdded == false)
                  {Toast.toast(context,msg: "您已取消订阅该电影",position: ToastPostion.bottom);}
                else{Toast.toast(context,msg: "您已订阅该电影",position: ToastPostion.bottom);}
              });
            }
        ),
      ],
    );
  }

}