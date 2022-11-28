import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';

class UserImageWidget extends StatelessWidget {
  final int index;

  const UserImageWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Container(
        height: SizeConfig.safeBlockHorizontal! * 12,
        width: SizeConfig.safeBlockHorizontal! * 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
          child: Image.network(
            'https://img.freepik.com/free-photo/close-up-portrait-wonderful-child-with-shiny-brown-eyes-looking-with-interest-enthusiastic-little-girl-vintage-straw-hat-decorated-with-ribbon-posing-during-game-park_197531-3960.jpg?w=2000',
            height: SizeConfig.screenHeight! * 0.05,
            width: SizeConfig.screenWidth! * 0.11,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    return Container();
  }
}
