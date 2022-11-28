import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    required this.width,
    this.fontsize,
    this.borderradius,
    required this.buttonText,
    this.height,
    this.isdisable,
    Key? key,
  }) : super(key: key);

  double? width;
  VoidCallback onTap;

  Color? buttonColor;
  double? borderradius;
  Color? textColor;
  double? fontsize;
  String buttonText;
  bool? isdisable;
  Color? borderColor;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? SizeConfig.screenHeight! * 0.063,
      decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderradius ?? SizeConfig.safeBlockHorizontal! * 3.5)),
      child: Material(
        color: Colors.transparent,
        child: isdisable == null
            ? InkWell(
                onTap: onTap,
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(color: textColor, fontSize: fontsize ?? SizeConfig.safeBlockHorizontal! * 3.7, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              )),
      ),
    );
  }
}
