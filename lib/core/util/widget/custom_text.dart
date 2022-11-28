import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/constant.dart';

class CustomText extends StatelessWidget {
  CustomText({
    this.color,
    required this.text,
    this.size,
    this.weight,
    Key? key,
  }) : super(key: key);
  Color? color;
  String text;
  double? size;
  FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? Constant.titleFontSize,
        fontWeight: weight ?? FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
