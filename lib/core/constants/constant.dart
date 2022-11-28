import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';

class Constant {
  static double titleFontSize = SizeConfig.safeBlockHorizontal! * 4.7;
  static double descriptionFontSize = SizeConfig.safeBlockHorizontal! * 3.7;
  static TextStyle descriptionTextStyle =
      TextStyle(fontStyle: FontStyle.normal, fontSize: descriptionFontSize, fontWeight: FontWeight.w400, height: 1.6);
  static TextStyle forgetPasswordStyle =
      TextStyle(fontStyle: FontStyle.normal, fontSize: descriptionFontSize, fontWeight: FontWeight.w400, height: 1.6, color: infoColor);
  static TextStyle titleTextStyle = TextStyle(fontStyle: FontStyle.normal, fontSize: titleFontSize, fontWeight: FontWeight.w700);
  static Color textFieldBackgroundColor = const Color(0xffF3F4F8);
  static InputBorder kEnableBoarder = OutlineInputBorder(
    //<-- SEE HERE
    borderSide: BorderSide(width: 1, color: Constant.textFieldBackgroundColor),
    borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
  );
  static InputBorder kFocusedBoarder = OutlineInputBorder(
    //<-- SEE HERE
    borderSide: const BorderSide(width: 1, color: infoColor),
    borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
  );
  static InputBorder kErrorboarder = OutlineInputBorder(
    //<-- SEE HERE
    borderSide: const BorderSide(width: 1, color: errorColor),
    borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
  );
  static SvgPicture svgIcon = SvgPicture.asset(appLogo, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown);
  static List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
}

Constant constant = Constant();
