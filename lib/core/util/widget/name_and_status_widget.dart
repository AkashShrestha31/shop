import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class NameAndStatusWidget extends StatelessWidget {
  final String? textfieldValue;
  final String? dropdownValue;
  const NameAndStatusWidget({Key? key, required this.status, required this.name, this.textfieldValue, this.dropdownValue}) : super(key: key);

  final String? name;
  final List<String>? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: name! + " Name", scale: 1.3),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 4,
        ),
        BoxTextField(
          initialValue: textfieldValue,
          autofocus: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          hint: categoryName,
          validator: (name) {},
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 6,
        ),
        TextWidget(text: "Status", scale: 1.3),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 4,
        ),
        CustomDropdownButton2(
          buttonWidth: SizeConfig.screenWidth!,
          buttonHeight: SizeConfig.screenHeight! * 0.06,
          dropdownWidth: SizeConfig.screenWidth! * 0.9,
          hint: 'Select',
          dropdownItems: status!,
          value: dropdownValue,
          onChanged: (value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
        ),
      ],
    );
  }
}
