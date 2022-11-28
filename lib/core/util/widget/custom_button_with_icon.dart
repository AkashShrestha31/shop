import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';

class CustomButtonIcon extends StatelessWidget {
  CustomButtonIcon({
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    required this.width,
    required this.buttonText,
    this.height,
    this.icon,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  double? width;
  VoidCallback onTap;

  Color? buttonColor;

  Color? textColor;

  String buttonText;

  Color? iconColor;
  Color? borderColor;
  double? height;
  String? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? SizeConfig.screenHeight! * 0.063,
      decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon!, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 3,
                ),
                Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: SizeConfig.safeBlockHorizontal! * 3.7, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
