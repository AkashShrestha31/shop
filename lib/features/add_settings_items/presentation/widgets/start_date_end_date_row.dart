import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/widgets.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class StartDateEndDateRow extends StatelessWidget {
  const StartDateEndDateRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: "Start Date", scale: 1.2),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            BoxTextField(
              width: SizeConfig.screenWidth! * 0.45,
              readOnly: true,
              hint: "Start Date",
              suffix: SvgPicture.asset(calendar, fit: BoxFit.scaleDown),
              validator: (phone) {},
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                } else {}
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: "End Date", scale: 1.2),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            BoxTextField(
              width: SizeConfig.screenWidth! * 0.45,
              readOnly: true,
              hint: "End Date",
              suffix: SvgPicture.asset(calendar, fit: BoxFit.scaleDown),
              validator: (phone) {},
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                } else {}
              },
            ),
          ],
        ),
      ],
    );
  }
}
