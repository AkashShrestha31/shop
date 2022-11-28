import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/boarding_screen/presentation/bloc/walk_through_bloc.dart';
import 'package:shoppos/features/shopworker/presentation/pages/shopworker_address_page.dart';
import 'package:shoppos/features/shopworker/presentation/pages/shopworker_newaccount_page.dart';
import 'package:shoppos/features/shopworker/presentation/pages/shopworker_personal_details_page.dart';
import 'package:shoppos/features/shopworker/presentation/pages/shopworker_upload_document_page.dart';

class ShopWorkerPage extends StatefulWidget {
  @override
  State<ShopWorkerPage> createState() => _ShopWorkerPageState();
}

class _ShopWorkerPageState extends State<ShopWorkerPage> {
  PageController controller = PageController(viewportFraction: 1, keepPage: true);

  final List<Widget> _list = [];

  void changePageViewPosition(int whichPage) {
    controller.animateToPage(whichPage, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walkthroughBloc.intCurrentPage();
    _list.add(ShopworkerPersonalDetailsPage());
    _list.add(ShopworkerAddressPage());
    _list.add(ShopworkerUploadDocumentPage());
    _list.add(ShopworkerNewaccountPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          "Shop Worker Registration",
          textScaleFactor: 1,
        )),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 10,
          )
        ],
      ),
      body: StreamBuilder<int>(
          stream: walkthroughBloc.currentPage,
          builder: (context, snapshot) {
            return Container(
              color: Colors.white,
              height: SizeConfig.screenHeight,
              child: Stack(
                children: <Widget>[
                  PageView.builder(
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
                  snapshot.data == 3
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {
                                    // Respond to button press
                                  },
                                  width: SizeConfig.screenWidth! * 0.85,
                                  buttonText: "Create an account",
                                  buttonColor: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                snapshot.data != 0
                                    ? CustomButton(
                                        onTap: () {
                                          // Respond to button press
                                          int page = walkthroughBloc.getCurrentPage() - 1;
                                          // if (page < 3) {
                                          walkthroughBloc.updateCurrentPage(page);
                                          controller.jumpToPage(page);
                                          // }
                                        },
                                        width: SizeConfig.screenWidth! * 0.4,
                                        buttonText: "Previous",
                                        buttonColor: Colors.white,
                                        textColor: Theme.of(context).primaryColor,
                                      )
                                    : Container(width: SizeConfig.screenWidth! * 0.4),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal! * 8,
                                ),
                                CustomButton(
                                  onTap: () {
                                    // Respond to button press
                                    int page = walkthroughBloc.getCurrentPage() + 1;
                                    // if (page < 3) {
                                    walkthroughBloc.updateCurrentPage(page);
                                    controller.jumpToPage(page);
                                    // }
                                  },
                                  width: SizeConfig.screenWidth! * 0.4,
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
