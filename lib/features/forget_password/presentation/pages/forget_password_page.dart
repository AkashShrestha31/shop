import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class ForgetPasswordPage extends StatelessWidget with InputValidationMixin {
  ForgetPasswordPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Colors.white,
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  forgetPasswordTitle,
                  style: Constant.titleTextStyle,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 3,
                ),
                Text(
                  forgetPasswordDescription,
                  style: Constant.descriptionTextStyle,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 7,
                ),
                BoxTextField(
                  keyboardType: TextInputType.number,
                  hint: phoneNo,
                  validator: (phone) {
                    if (phone!.isNotEmpty) {
                      if (isPhoneValid(phone)) {
                        return null;
                      } else {
                        return enterphoneError;
                      }
                    } else {
                      return emptyphoneError;
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
                      AutoRouter.of(context).push(OTPVerificationRoute());
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
        ));
  }
}
