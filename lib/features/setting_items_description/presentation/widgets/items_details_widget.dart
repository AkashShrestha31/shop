import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button_with_icon.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/details_row_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ItemsDetailsWidget extends StatefulWidget {
  @override
  State<ItemsDetailsWidget> createState() => _ItemsDetailsWidgetState();
}

class _ItemsDetailsWidgetState extends State<ItemsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Container(
        height: SizeConfig.screenHeight,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Service Charges Details",
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
                  leftText: "Serial No.",
                  rightText: "#29392",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.grey[200],
                ),
                DetailsRowWidget(
                  leftText: "Service Name",
                  rightText: "Service Name",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.white,
                ),
                DetailsRowWidget(
                  leftText: "Service Type",
                  rightText: "Percent",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.grey[200],
                ),
                DetailsRowWidget(
                  leftText: "Status",
                  rightText: "Active",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.white,
                  rightTextColor: Colors.green,
                ),
                DetailsRowWidget(
                  leftText: "Created By",
                  rightText: "Jane Copper",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.grey[200],
                ),
                DetailsRowWidget(
                  leftText: "Created On",
                  rightText: "2042-2-13",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.white,
                ),
                DetailsRowWidget(
                  leftText: "Rate",
                  rightText: "100",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.grey[200],
                ),
                DetailsRowWidget(
                  leftText: "Choice",
                  rightText: "Positive",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.white,
                ),
                DetailsRowWidget(
                  leftText: "Start Date",
                  rightText: "2042-2-13",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.grey[200],
                ),
                DetailsRowWidget(
                  leftText: "End Date",
                  rightText: "2042-2-13",
                  textAlign: TextAlign.right,
                  backgroundColor: Colors.white,
                ),
                Container(
                  height: SizeConfig.screenHeight! * 0.06,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 1),
                    color: Colors.grey[200],
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
    );
  }
}
