import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/password_form_field.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';

class NewPasswordPage extends StatelessWidget with InputValidationMixin {
  NewPasswordPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reenterPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: true,
                iconTheme: const IconThemeData(
                  color: Colors.black, //change your color here
                ),
              ),
              body: Form(
                key: formGlobalKey,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        enterNewPasswordTitle,
                        style: Constant.titleTextStyle,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal! * 3,
                      ),
                      Text(
                        enterNewPasswordDescription,
                        style: Constant.descriptionTextStyle,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      PasswordTextField(
                        controller: passwordController,
                        prefix: SvgPicture.asset(loginPasswordIcon, fit: BoxFit.scaleDown),
                        suffix: Icons.password,
                        hint: newPassword,
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
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal! * 3,
                      ),
                      PasswordTextField(
                        controller: reenterPasswordController,
                        prefix: SvgPicture.asset(loginPasswordIcon, fit: BoxFit.scaleDown),
                        hint: confirmPassword,
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
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal! * 7,
                      ),
                      CustomButton(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // use the email provided here
                            if (passwordController.text.toString() == reenterPasswordController.text.toString()) {
                            } else {}
                          }
                        },
                        width: SizeConfig.screenWidth!,
                        buttonText: sendOTP,
                        buttonColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              )),
          // Container(
          //   height: SizeConfig.screenHeight,
          //   width: SizeConfig.screenWidth,
          //   color: Colors.grey.withOpacity(0.5),
          //   child: Center(
          //     child: Container(
          //       padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
          //       height: SizeConfig.screenHeight! * 0.55,
          //       width: SizeConfig.screenWidth! * 0.85,
          //       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3.5)),
          //       child: Column(
          //         children: [
          //           SvgPicture.asset(appLogo,
          //               color: Theme.of(context).primaryColor, semanticsLabel: 'App Logo', height: SizeConfig.screenHeight! * 0.2),
          //           SizedBox(
          //             height: SizeConfig.safeBlockHorizontal! * 5,
          //           ),
          //           CustomText(
          //             text: congratulation,
          //             color: Theme.of(context).primaryColor,
          //             size: SizeConfig.safeBlockHorizontal! * 4.9,
          //             weight: FontWeight.w600,
          //           ),
          //           SizedBox(
          //             height: SizeConfig.safeBlockHorizontal! * 5,
          //           ),
          //           CustomText(
          //             text: accountReady,
          //             size: Constant.descriptionFontSize,
          //             weight: FontWeight.w400,
          //           ),
          //           SizedBox(
          //             height: SizeConfig.safeBlockHorizontal! * 8,
          //           ),
          //           const CircularProgressIndicator()
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
