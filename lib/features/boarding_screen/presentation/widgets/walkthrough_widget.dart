import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';

class WaltkThroughWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  const WaltkThroughWidget({required this.title, required this.description, required this.image});
  @override
  Widget build(BuildContext context) {
    SvgPicture? svgIcon = SvgPicture.asset(image!, semanticsLabel: 'Boarding Screen', fit: BoxFit.scaleDown);
    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 6),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          svgIcon,
          SizedBox(
            height: SizeConfig.screenHeight! * 0.04,
          ),
          Text(
            title!,
            style: Constant.titleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Text(
            description!,
            style: Constant.descriptionTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
