import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';

class TitleWidget extends StatelessWidget {
  final int index;

  TitleWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 2:
        return const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textScaleFactor: 1.3,
        );
      case 3:
        return const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textScaleFactor: 1.3,
        );
      default:
        return SvgPicture.asset(
          appLogo,
          color: Colors.white,
          semanticsLabel: 'App Logo',
          fit: BoxFit.scaleDown,
          height: SizeConfig.screenHeight! * 0.03,
        );
    }
  }
}
