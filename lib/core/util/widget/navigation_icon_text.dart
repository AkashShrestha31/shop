import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';

class NavigationIconAndText extends StatelessWidget {
  final int? index;
  final int? value;
  final String? text;

  final String? icon;
  final VoidCallback? onTap;
  const NavigationIconAndText({Key? key, required this.index, required this.text, required this.icon, required this.onTap, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        width: SizeConfig.safeBlockHorizontal! * 14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon!, color: index == value! ? infoColor : iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
            Text(
              text!,
              style: TextStyle(color: index == value! ? infoColor : iconColor),
            )
          ],
        ),
      ),
    );
  }
}
