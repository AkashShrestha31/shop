import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class HomeScreenPageContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Color? gradient1;
  final Color? gradient2;

  const HomeScreenPageContainer({
    required this.title,
    required this.subTitle,
    required this.gradient1,
    required this.gradient2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.13,
      width: SizeConfig.screenWidth! * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: <Color>[gradient1!, gradient2!]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: title!,
            scale: 2,
            color: Colors.white,
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 2,
          ),
          TextWidget(
            text: subTitle!,
            scale: 1.1,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
