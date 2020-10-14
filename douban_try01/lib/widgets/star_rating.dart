import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StarRating extends StatefulWidget {
  final double Rating;
  final double MaxRating;
  final double size;
  final int count;
  final Color Selectcolor;
  final Color unsecectcolor;
  final Widget selectImage;
  final Widget unselectImage;
  StarRating(
      {@required this.Rating,
        this.MaxRating=10,
        this.count=5,
        this.size=30,
        this.Selectcolor=const Color(0xffff0000),
        this.unsecectcolor=const Color(0xffbbbbbb),
        Widget selectImage,
        Widget unselectImage

      }):selectImage=selectImage??Icon(Icons.star_border,color: unsecectcolor,size: size,),
        unselectImage=unselectImage??Icon(Icons.star,color: Selectcolor,size: size,) ;
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: bulidunselectstar()),
        Row(mainAxisSize: MainAxisSize.min, children: bulidselectstar())
      ],
    );
  }
  List<Widget> bulidunselectstar(){
    return List.generate(widget.count, (index){
      return widget.selectImage;
    });
  }
  List<Widget> bulidselectstar()
  {
    List<Widget> stars=[];
    final star=widget.unselectImage;

    double onevalue=widget.MaxRating/widget.count;
    int entirecount=(widget.Rating/onevalue).floor();
    for(int i=0;i<entirecount;i++)
    {
      stars.add(star);
    }
    double width=((widget.Rating/onevalue)-entirecount)*widget.size;
    final starleft=ClipRect(
      clipper: Mystarclipper(width),
      child: star,
    );
    stars.add(starleft);
    return stars;
  }
}
class Mystarclipper extends CustomClipper<Rect>{
  double width;
  Mystarclipper(this.width);
  @override
  getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}