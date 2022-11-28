import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/navigation_icon_text.dart';
import 'package:shoppos/features/home/presentation/bloc/home_navigation_bloc.dart';

class ButtomNavigationBar extends StatelessWidget {
  final int index;
  const ButtomNavigationBar({required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.08,
      child: BottomAppBar(
        //bottom navigation bar on scaffold
        color: const Color(0xFFF3F4F8),
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavigationIconAndText(
                index: index,
                text: "Home",
                icon: home,
                value: 0,
                onTap: () {
                  homeNavigationBloc.updateCurrentPage(0);
                }),
            NavigationIconAndText(
                index: index,
                text: "Shop",
                icon: buy,
                value: 1,
                onTap: () {
                  homeNavigationBloc.updateCurrentPage(1);
                }),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal!,
            ),
            NavigationIconAndText(
                index: index,
                text: "Settings",
                value: 2,
                icon: newsetting,
                onTap: () {
                  homeNavigationBloc.updateCurrentPage(2);
                }),
            NavigationIconAndText(
                index: index,
                text: "Profile",
                value: 3,
                icon: newprofile,
                onTap: () {
                  homeNavigationBloc.updateCurrentPage(3);
                }),
          ],
        ),
      ),
    );
  }
}
