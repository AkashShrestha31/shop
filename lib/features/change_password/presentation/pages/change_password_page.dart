import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/password_form_field.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ChangePasswordPage extends StatelessWidget with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Change Password",
          textScaleFactor: 1,
        )),
        actions: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 6,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Old Password", scale: 1.2),
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
                    TextWidget(text: "New Password", scale: 1.2),
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 3),
              width: SizeConfig.screenWidth,
              child: Center(
                child: CustomButton(
                  onTap: () {},
                  width: SizeConfig.screenWidth! * 0.9,
                  buttonText: "Save",
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
