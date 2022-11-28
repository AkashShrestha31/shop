import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppos/core/constants/colors.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double? scale;
  final Color? color;
  final TextAlign? textAlign;
  TextWidget({required this.text, this.weight, required this.scale, this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontWeight: weight ?? FontWeight.normal, color: color ?? iconColor),
      textScaleFactor: scale!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
