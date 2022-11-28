import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/features/home/presentation/bloc/home_navigation_bloc.dart';
import 'package:shoppos/features/home/presentation/pages/custom_app_bar.dart';
import 'package:shoppos/features/home/presentation/pages/navigation_drawer.dart';
import 'package:shoppos/features/home/presentation/widgets/body_widget.dart';
import 'package:shoppos/features/home/presentation/widgets/buttom_navigation_bar.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    homeNavigationBloc.intCurrentPage();
    return StreamBuilder<int>(
        stream: homeNavigationBloc.currentPage,
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                //Floating action button on Scaffold
                onPressed: () {
                  //code to execute on button press
                  AutoRouter.of(context).push(QRScanRoute());
                },
                child: SvgPicture.asset(scan, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown), //icon inside button
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              //floating action button position to center
              bottomNavigationBar: ButtomNavigationBar(index: snapshot.data!),
              drawer: const NavigationDrawer(),
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: [
                      CustomAppBar(index: snapshot.data!),
                      Expanded(
                        child: BodyWidget(index: snapshot.data!),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
