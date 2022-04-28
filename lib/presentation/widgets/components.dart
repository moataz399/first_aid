import 'package:flutter/material.dart';

void navigateTo({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


class SliderObject {
  String name;
  String des;
  String image;

  SliderObject(this.name, this.des, this.image);
}
