import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/password_form_field.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ShopworkerNewaccountPage extends StatelessWidget with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Create New Account",
            scale: 1.4,
            color: Colors.black,
            weight: FontWeight.w500,
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
              TextWidget(text: "Create Password", scale: 1.2),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              PasswordTextField(
                prefix: SvgPicture.asset(loginPasswordIcon, fit: BoxFit.scaleDown),
                hint: password,
                validator: (password) {
                  if (password!.isNotEmpty) {
                    if (isPasswordValid(password)) {
                      return null;
                    } else {
                      return enterPasswordError;
                    }
                  } else {
                    return emptyPasswordError;
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Confirm Password", scale: 1.2),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              PasswordTextField(
                prefix: SvgPicture.asset(loginPasswordIcon, fit: BoxFit.scaleDown),
                hint: password,
                validator: (password) {
                  if (password!.isNotEmpty) {
                    if (isPasswordValid(password)) {
                      return null;
                    } else {
                      return enterPasswordError;
                    }
                  } else {
                    return emptyPasswordError;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
