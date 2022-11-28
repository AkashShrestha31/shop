import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class NameValueStatusWidget extends StatelessWidget {
  const NameValueStatusWidget({
    Key? key,
    required this.status,
    this.subAttribute,
    this.value,
    this.select_status,
  }) : super(key: key);

  final List<String> status;
  final String? subAttribute;
  final String? value;
  final String? select_status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: "Name", scale: 1.3),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            BoxTextField(
              initialValue: subAttribute,
              autofocus: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hint: "Sub-attribute name",
              validator: (name) {},
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Value", scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                BoxTextField(
                  initialValue: value,
                  width: SizeConfig.screenWidth! * 0.4,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  hint: "Enter the Value Name",
                  validator: (name) {},
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Status", scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                CustomDropdownButton2(
                  buttonWidth: SizeConfig.screenWidth! * 0.4,
                  buttonHeight: SizeConfig.screenHeight! * 0.06,
                  dropdownWidth: SizeConfig.screenWidth! * 0.4,
                  hint: 'Select',
                  dropdownItems: status,
                  value: select_status,
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
          height: SizeConfig.safeBlockHorizontal! * 6,
        ),
      ],
    );
  }
}
