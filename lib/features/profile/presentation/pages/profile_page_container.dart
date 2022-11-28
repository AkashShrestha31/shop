import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ProfilePageContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? icon;
  final Color? iconcolor;
  final Color? titlecolor;
  final Color? subtitlecolor;
  final VoidCallback? onTap;
  const ProfilePageContainer({
    @required this.title,
    this.titlecolor,
    this.subtitlecolor,
    @required this.subtitle,
    @required this.onTap,
    this.iconcolor,
    @required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 4), color: Colors.grey[200]),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(icon!, color: iconcolor ?? Colors.black, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: title!,
                    scale: 1.2,
                    color: titlecolor ?? Colors.black,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 2,
                  ),
                  TextWidget(
                    text: subtitle,
                    scale: 1.1,
                    color: subtitlecolor ?? iconColor,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
