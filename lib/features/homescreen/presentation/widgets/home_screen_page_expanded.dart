import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class HomeScreenPageExpanded extends StatelessWidget {
  final String? text;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final Color? textColor;
  final Color? containerColor;
  final VoidCallback? onTap;
  const HomeScreenPageExpanded({
    required this.text,
    required this.topRight,
    required this.topLeft,
    required this.bottomRight,
    required this.bottomLeft,
    required this.textColor,
    required this.containerColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap!,
        child: Container(
          height: SizeConfig.screenHeight! * 0.04,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft!),
                  bottomLeft: Radius.circular(bottomLeft!),
                  topRight: Radius.circular(topRight!),
                  bottomRight: Radius.circular(bottomRight!)),
              color: containerColor ?? Colors.green),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: text,
                scale: 1.1,
                color: textColor ?? Colors.black,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
