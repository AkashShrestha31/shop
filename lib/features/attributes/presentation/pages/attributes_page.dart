import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/search_filter_sort_widget.dart';
import 'package:shoppos/core/util/widget/sort_widget.dart';
import 'package:shoppos/features/attributes/presentation/bloc/attributes_bloc.dart';
import 'package:shoppos/features/attributes/presentation/bloc/attributes_event.dart';
import 'package:shoppos/features/attributes/presentation/widgets/setting_item_body_widget.dart';
import 'package:shoppos/features/category/presentation/widgets/category_details_page.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/delete_product_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/injection_container.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class AttributesPage extends StatelessWidget {
  final String? name;

  AttributesPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider(
          create: (context) => sl<AttributesBloc>()..add(GetAttributesData()),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Center(
                  child: Text(
                name!,
                textScaleFactor: 1,
              )),
              actions: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 3,
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3),
                  child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(CategoryArchiveRoute(name: name!));
                      },
                      child: SvgPicture.asset(archive, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      SearchFilterSortWidget(name: "attributes"),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => Container(
                                height: SizeConfig.screenHeight! * 0.4,
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 8),
                                      topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 8)),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal! * 6,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Sort By",
                                            scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                            weight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.safeBlockHorizontal! * 6,
                                            right: SizeConfig.safeBlockHorizontal! * 6,
                                            top: SizeConfig.safeBlockHorizontal! * 3,
                                            bottom: SizeConfig.safeBlockHorizontal! * 3),
                                        child: TextWidget(
                                          text: "Active",
                                          scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                          weight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.safeBlockHorizontal! * 6,
                                        right: SizeConfig.safeBlockHorizontal! * 6,
                                      ),
                                      child: Divider(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.safeBlockHorizontal! * 6,
                                            right: SizeConfig.safeBlockHorizontal! * 6,
                                            top: SizeConfig.safeBlockHorizontal! * 3,
                                            bottom: SizeConfig.safeBlockHorizontal! * 3),
                                        child: TextWidget(
                                          text: "Inactive",
                                          scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                          weight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.safeBlockHorizontal! * 6,
                                        right: SizeConfig.safeBlockHorizontal! * 6,
                                      ),
                                      child: Divider(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal! * 6,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomButton(
                                          onTap: () {},
                                          width: SizeConfig.screenWidth! * 0.4,
                                          borderColor: Theme.of(context).primaryColor,
                                          buttonText: "Reset",
                                          buttonColor: Colors.white,
                                          textColor: Colors.black,
                                        ),
                                        CustomButton(
                                          onTap: () {},
                                          width: SizeConfig.screenWidth! * 0.4,
                                          buttonText: "Apply",
                                          buttonColor: Theme.of(context).primaryColor,
                                          textColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(filter, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      SortWidget()
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 8,
                  ),
                  SettingItemBodyWidget(name: name!),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
              child: FloatingActionButton(
                // isExtended: true,
                child: const Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  AutoRouter.of(context).push(AddAttributesRoute(name: name!, subAttributeList: []));
                },
              ),
            ),
          ),
        ),
        StreamBuilder<int>(
            stream: settingsBloc.screen,
            initialData: 3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data) {
                  case 0:
                    return DeleteProductWidget(
                      name: "attributes",
                    );
                    break;
                  case 1:
                    return CategoryDetailsWidget(name: name!);
                    break;
                  case 10:
                    AutoRouter.of(context).push(ViewAttributesRoute(name: name!, subAttributeList: []));
                    break;
                  default:
                    return Container();
                }
              }
              return Container();
            })
      ],
    );
  }
}
