import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ShopworkerPersonalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "Personal Details",
              scale: 1.4,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: name, scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                BoxTextField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  hint: name,
                  validator: (name) {},
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: phoneno, scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                BoxTextField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  hint: phoneno,
                  validator: (name) {},
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Contact Number", scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                BoxTextField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  hint: "Contact Number",
                  validator: (name) {},
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Email Address", scale: 1.3),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                BoxTextField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  hint: "Email Address",
                  validator: (name) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
