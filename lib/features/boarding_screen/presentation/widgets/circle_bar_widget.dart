import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';

class CircleBarWidget extends StatelessWidget {
  final bool? is_active;
  const CircleBarWidget({required this.is_active});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: is_active! ? SizeConfig.safeBlockHorizontal! * 2 : SizeConfig.safeBlockHorizontal! * 2,
      width: is_active! ? SizeConfig.safeBlockHorizontal! * 6 : SizeConfig.safeBlockHorizontal! * 2,
      decoration: BoxDecoration(
          color: is_active! ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: is_active!
              ? BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal!))
              : BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal!))),
    );
  }
}
