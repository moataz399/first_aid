import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  TextOverflow textOverflow;
  double size;

  BigText(
      {Key? key,
        required this.text,
        this.color = const Color(0xFF07060C),
        this.textOverflow = TextOverflow.ellipsis,
        this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Europa',
          color: color,
          fontSize: size==0 ? 35:size,
          overflow: textOverflow,
          fontWeight: FontWeight.bold),
    );
  }
}
