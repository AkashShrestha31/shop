import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/features/add_settings_items/presentation/bloc/add_settings_bloc.dart';
import 'package:shoppos/features/add_settings_items/presentation/widgets/start_date_end_date_row.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class AddSettingItemsPage extends StatelessWidget {
  final List<String> typeItems = [
    'Percentage',
    'Money',
  ];
  final List<String> choiceItems = [
    'Positive',
    'Negative',
  ];
  final List<String> status = [
    'Active',
    'Inactive',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    addSettingsItemsBloc.updateTypeStatus(3);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
          title: const Center(
              child: Text(
            "Add Service Charges",
            textScaleFactor: 1,
          )),
          actions: [
            SizedBox(
              width: SizeConfig.screenWidth! * 0.09,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Service Name", scale: 1.2),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                    BoxTextField(
                      hint: "Service name",
                      validator: (phone) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                StreamBuilder<int>(
                    stream: addSettingsItemsBloc.selectType,
                    initialData: 3,
                    builder: (context, snapshot) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Select Type", scale: 1.2),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          CustomDropdownButton2(
                            buttonWidth: SizeConfig.screenWidth,
                            buttonHeight: SizeConfig.screenHeight! * 0.06,
                            dropdownWidth: SizeConfig.screenWidth! * 0.95,
                            hint: 'Select Type',
                            dropdownItems: typeItems,
                            value: snapshot.data != 3 ? typeItems[snapshot.data!] : null,
                            onChanged: (value) {
                              if (value == typeItems[0]) {
                                addSettingsItemsBloc.updateTypeStatus(0);
                              } else {
                                addSettingsItemsBloc.updateTypeStatus(1);
                              }
                              // setState(() {
                              //   selectedValue = value;
                              // });
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          Visibility(
                            visible: snapshot.data == 0 ? true : false,
                            child: BoxTextField(
                              hint: "Enter Percent",
                              suffix: SvgPicture.asset(percent, fit: BoxFit.scaleDown),
                              validator: (phone) {},
                            ),
                          ),
                          Visibility(
                            visible: snapshot.data == 1 ? true : false,
                            child: BoxTextField(
                              hint: "Enter Amount",
                              prefix: SvgPicture.asset(rs, fit: BoxFit.scaleDown),
                              validator: (phone) {},
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Rate", scale: 1.2),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 4,
                        ),
                        BoxTextField(
                          width: SizeConfig.screenWidth! * 0.45,
                          readOnly: false,
                          hint: "Enter Rate",
                          suffix: SvgPicture.asset(rate, fit: BoxFit.scaleDown),
                          validator: (phone) {},
                          onTap: () async {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Status", scale: 1.2),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 4,
                        ),
                        CustomDropdownButton2(
                          buttonWidth: SizeConfig.screenWidth! * 0.45,
                          buttonHeight: SizeConfig.screenHeight! * 0.06,
                          dropdownWidth: SizeConfig.screenWidth! * 0.4,
                          hint: 'Select',
                          dropdownItems: status,
                          value: selectedValue,
                          onChanged: (value) {
                            // setState(() {
                            //   selectedValue = value;
                            // });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Choice", scale: 1.2),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                    CustomDropdownButton2(
                      buttonWidth: SizeConfig.screenWidth,
                      buttonHeight: SizeConfig.screenHeight! * 0.06,
                      dropdownWidth: SizeConfig.screenWidth! * 0.95,
                      hint: 'Choice',
                      dropdownItems: choiceItems,
                      value: selectedValue,
                      onChanged: (value) {
                        // setState(() {
                        //   selectedValue = value;
                        // });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                StartDateEndDateRow(),
              ],
            ),
          ),
        ));
  }
}
