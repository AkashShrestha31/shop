import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/boarding_screen/presentation/bloc/walk_through_bloc.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/circle_bar_widget.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/walkthrough_widget.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class DisplayWalkthroughPage extends StatelessWidget {
  final ShowSliderModel? showSliderModel;
  DisplayWalkthroughPage({Key? key, required this.showSliderModel}) : super(key: key);
  PageController controller = PageController(viewportFraction: 1, keepPage: true);
  final List<Widget> _list = [];
  void changePageViewPosition(int whichPage) {
    controller.animateToPage(whichPage, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void addDataToList() {
    for (int i = 0; i < showSliderModel!.items!.length; i++) {
      _list.add(WaltkThroughWidget(
          title: showSliderModel!.items![i].title, description: showSliderModel!.items![i].description, image: showSliderModel!.items![i].image));
    }
  }

  @override
  Widget build(BuildContext context) {
    addDataToList();
    walkthroughBloc.intCurrentPage();
    return Material(
      color: Colors.white,
      child: StreamBuilder<int>(
          stream: walkthroughBloc.currentPage,
          builder: (context, snapshot) {
            return Container(
              color: Colors.white,
              height: SizeConfig.screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      onPageChanged: (int page) {
                        walkthroughBloc.updateCurrentPage(page);
                      },
                      controller: controller,
                      itemBuilder: (context, index) {
                        return _list[index];
                      },
                      itemCount: _list.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      for (int i = 0; i < _list.length; i++)
                        if (i == snapshot.data) ...[const CircleBarWidget(is_active: true)] else const CircleBarWidget(is_active: false),
                    ],
                  ),
                  snapshot.data == 2
                      ? Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  // Respond to button press
                                  AutoRouter.of(context).replace(const LoginScreenRoute());
                                },
                                width: SizeConfig.screenWidth! * 0.85,
                                buttonText: getStarted,
                                buttonColor: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {
                                    // Respond to button press
                                    int page = walkthroughBloc.getCurrentPage() + 1;
                                    if (page < 3) {
                                      walkthroughBloc.updateCurrentPage(page);
                                      controller.jumpToPage(page);
                                    }
                                  },
                                  width: SizeConfig.screenWidth! * 0.25,
                                  buttonText: next,
                                  buttonColor: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }
}
