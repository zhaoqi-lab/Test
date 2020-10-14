import 'package:flutter/material.dart';
class IconIndividuality extends StatefulWidget {
  Icon icons;
  Text texts;
  Color color;
  double  size;
  IconIndividuality({
    Key key,this.icons,this.texts,this.color,this.size
  }) : super(key: key);

  @override
  _IconIndividualityState createState() => _IconIndividualityState();
}

class _IconIndividualityState extends State<IconIndividuality> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          child: IconButton(icon:widget.icons,
            onPressed: null,
            color:Color.fromRGBO(159,159,159, 1),
            iconSize: widget.size==null? 36:widget.size,
            padding: EdgeInsets.all(10.0),
          ),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: widget.color==null? Color.fromRGBO(243,245,242,1):widget.color,

          ),

        ),
        SizedBox(
          height: 5,
        ),
        widget.texts,

      ],
    );
  }
}