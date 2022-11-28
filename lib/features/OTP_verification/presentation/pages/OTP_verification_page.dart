import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/custom_text.dart';
import 'package:shoppos/features/OTP_verification/presentation/widgets/otp_field.dart';
import 'package:shoppos/features/OTP_verification/presentation/widgets/style.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class OTPVerificationPage extends StatelessWidget with InputValidationMixin {
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  OtpFieldController otpController = OtpFieldController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
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
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                otpVerificationTitle,
                style: Constant.titleTextStyle,
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 3,
              ),
              Text(
                otpVerificationDescription,
                style: Constant.descriptionTextStyle,
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 7,
              ),
              OTPTextField(
                length: 4,
                controller: otpController,
                width: MediaQuery.of(context).size.width,
                fieldWidth: SizeConfig.screenWidth! * 0.15,
                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal! * 5),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return CustomText(
                          text: 'Expired',
                          weight: FontWeight.w400,
                          size: Constant.descriptionFontSize,
                        );
                      }
                      return CustomText(
                        text: 'Expires in 0${time.min != null ? time.min : 0}:${time.sec}',
                        weight: FontWeight.w400,
                        size: Constant.descriptionFontSize,
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: 'Re-send Code',
                      weight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                      size: Constant.descriptionFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 7,
              ),
              CustomButton(
                onTap: () {
                  bool checkEmpty = false;
                  List<String> otp = otpController.getValue();
                  for (int i = 0; i < otp.length; i++) {
                    if (otp[i].isEmpty) {
                      checkEmpty = true;
                      break;
                    }
                  }
                  // if (!checkEmpty) {
                  AutoRouter.of(context).push(NewPasswordRoute());
                  // }
                },
                width: SizeConfig.screenWidth!,
                buttonText: cont,
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
