import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/search_filter_sort_widget.dart';
import 'package:shoppos/core/util/widget/sort_widget.dart';
import 'package:shoppos/features/category/presentation/bloc/category_bloc.dart';
import 'package:shoppos/features/category/presentation/bloc/category_event.dart';
import 'package:shoppos/features/category/presentation/widgets/category_details_page.dart';
import 'package:shoppos/features/category/presentation/widgets/setting_item_body_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/delete_product_widget.dart';
import 'package:shoppos/injection_container.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class CategoryPage extends StatelessWidget {
  final String? name;

  CategoryPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider(
          create: (context) => sl<CategoryBloc>()..add(GetCategoryData()),
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
                      SearchFilterSortWidget(name: "category"),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      SvgPicture.asset(filter, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      SortWidget()
                      // SvgPicture.asset(sort, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
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
                child: Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  AutoRouter.of(context).push(AddCategoryRoute(name: name!));
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
                    return DeleteProductWidget(name: "category");
                    break;
                  case 1:
                    return CategoryDetailsWidget(name: name!);
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
