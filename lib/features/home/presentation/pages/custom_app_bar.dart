import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/home/presentation/widgets/title_widget.dart';
import 'package:shoppos/features/home/presentation/widgets/user_image_widget.dart';

class CustomAppBar extends StatelessWidget {
  final int index;
  const CustomAppBar({required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        height: SizeConfig.screenHeight! * 0.08,
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 2, right: SizeConfig.safeBlockHorizontal! * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (BuildContext context) {
                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white, // Change Custom Drawer Icon Color
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 2,
                      ),
                      TitleWidget(index: index)
                    ],
                  );
                },
              ),
              UserImageWidget(index: index),
            ],
          ),
        ));
  }
}
