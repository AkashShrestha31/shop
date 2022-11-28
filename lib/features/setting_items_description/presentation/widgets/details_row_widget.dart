import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class DetailsRowWidget extends StatelessWidget {
  final double? padding;
  final String? leftText;
  final String? rightText;
  final Color? backgroundColor;
  final Color? leftTextColor;
  final Color? rightTextColor;
  final TextAlign? textAlign;

  DetailsRowWidget(
      {this.textAlign,
      required this.leftText,
      required this.rightText,
      required this.backgroundColor,
      this.leftTextColor,
      this.rightTextColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 1),
        color: backgroundColor ?? Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? SizeConfig.safeBlockHorizontal! * 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TextWidget(
            //   text: leftText!,
            //   scale: 1.1,
            //   color: leftTextColor ?? iconColor,
            // ),
            Expanded(
              flex: 1,
              child: TextWidget(
                text: leftText!,
                scale: 1.1,
                color: leftTextColor ?? iconColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextWidget(
                text: rightText!,
                scale: 1.1,
                weight: FontWeight.w500,
                color: rightTextColor ?? Colors.black,
                textAlign: textAlign,
              ),
            )
          ],
        ),
      ),
    );
  }
}
