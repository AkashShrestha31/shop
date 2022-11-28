import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/features/settings/data/models/setting_data_model.dart';
import 'package:shoppos/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    settingsDataBloc.getSettingsData();
    return StreamBuilder<SettingsDataModel>(
        stream: settingsDataBloc.settingsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.items!.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 3),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print(snapshot.data!.items![i].id.toString());
                          switch (snapshot.data!.items![i].id.toString()) {
                            case "1":
                              AutoRouter.of(context).push(SettingItemsDetailsRoute());
                              break;
                            case "2":
                              AutoRouter.of(context).push(CategoryRoute(name: "Brands"));
                              break;
                            case "3":
                              AutoRouter.of(context).push(CategoryRoute(name: "Category"));
                              break;
                            case "4":
                              AutoRouter.of(context).push(AttributesRoute(name: "Attribute"));
                              break;

                            case "5":
                              AutoRouter.of(context).push(ProductsRoute(name: "Products"));
                              break;

                            default:
                              break;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: SizeConfig.screenHeight! * 0.06,
                                  width: SizeConfig.screenWidth! * 0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 2)),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 3),
                                    child: SvgPicture.asset(snapshot.data!.items![i].image!,
                                        color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal! * 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.items![i].title!,
                                      textScaleFactor: 1.2,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal!,
                                    ),
                                    Text(
                                      snapshot.data!.items![i].subtitle!,
                                      textScaleFactor: 1.1,
                                      style: TextStyle(color: iconColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                              iconSize: SizeConfig.safeBlockHorizontal! * 5,
                              color: iconColor,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.8,
                            child: const Divider(),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        });
  }
}
