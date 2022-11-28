import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/discard_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

import '../widgets/add_category_page_widget.dart';

class AddCategoryPage extends StatelessWidget {
  final String? name;

  AddCategoryPage({required this.name});

  final List<String> status = [
    'Active',
    'Inactive',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Center(
                  child: Text(
                " Add " + name!,
                textScaleFactor: 1,
              )),
              leading: IconButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  settingsBloc.updateScreenStatus(0);
                },
                icon: Icon(Icons.close),
              ),
              actions: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 15,
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  AddCategoryPageWidget(status: status, name: name),
                  Positioned(
                    bottom: 0,
                    child: CustomButton(
                      onTap: () {},
                      width: SizeConfig.screenWidth! * 0.9,
                      buttonText: "Save",
                      buttonColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
        StreamBuilder<int>(
            stream: settingsBloc.screen,
            initialData: 3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data) {
                  case 0:
                    return DiscardWidget();
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
