import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button_with_icon.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/details_row_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  final String? name;

  CategoryDetailsWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      color: Colors.grey.withOpacity(0.5),
      child: Center(
        child: Container(
          height: SizeConfig.screenHeight! * 0.45,
          width: SizeConfig.screenWidth! * 0.9,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 3),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: name! + " Details",
                        scale: 1.3,
                        color: Colors.black,
                        weight: FontWeight.w500,
                      ),
                      IconButton(
                          onPressed: () {
                            settingsBloc.updateScreenStatus(3);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  DetailsRowWidget(
                    leftText: name! + " Name",
                    rightText: name! + " Name",
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Status",
                    rightText: "Active",
                    backgroundColor: Colors.white,
                    rightTextColor: Colors.green,
                  ),
                  DetailsRowWidget(
                    leftText: "Created By",
                    rightText: "Jane Copper",
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Created On",
                    rightText: "2042-2-13",
                    backgroundColor: Colors.white,
                  ),
                  DetailsRowWidget(
                    leftText: "Start Date",
                    rightText: "2042-2-13",
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "End Date",
                    rightText: "2042-2-13",
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    height: SizeConfig.screenHeight! * 0.06,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 3, right: SizeConfig.safeBlockHorizontal! * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(text: "Actions", scale: 1.2),
                          Row(
                            children: [
                              CustomButtonIcon(
                                onTap: () {
                                  settingsBloc.updateScreenStatus(3);
                                },
                                width: SizeConfig.screenWidth! * 0.23,
                                height: SizeConfig.screenHeight! * 0.05,
                                buttonText: "Edit",
                                buttonColor: Color.fromRGBO(51, 96, 187, 0.3),
                                textColor: Color(0xFF3360BB),
                                icon: edit,
                                iconColor: Color(0xFF3360BB),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 3,
                              ),
                              CustomButtonIcon(
                                onTap: () {
                                  settingsBloc.updateScreenStatus(3);
                                },
                                width: SizeConfig.screenWidth! * 0.25,
                                height: SizeConfig.screenHeight! * 0.05,
                                buttonText: "Delete",
                                buttonColor: Color.fromRGBO(252, 65, 65, 0.3),
                                textColor: Colors.redAccent,
                                icon: delete1,
                                iconColor: Colors.redAccent,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
