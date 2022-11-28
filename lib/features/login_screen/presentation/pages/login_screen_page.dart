import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/storage/local_storage_repository.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/password_form_field.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/widgets.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/checkbox_bloc.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_bloc.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_event.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_state.dart';
import 'package:shoppos/routes/app_router.gr.dart';

import '../../../../core/constants/strings.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
    TextEditingController usernameController = TextEditingController();
    usernameController.text="9803723232";
    TextEditingController passwordController = TextEditingController();
    passwordController.text="MnbvcxZ@#1";
    SvgPicture svgIcon = SvgPicture.asset(appLogo, color: Theme.of(context).primaryColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown);
    final focus = FocusNode();

    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Container(
              height: SizeConfig.screenHeight,
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 23,
                  ),
                  svgIcon,
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 13,
                  ),
                  Text(
                    loginTitle,
                    style: Constant.titleTextStyle,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  Text(
                    loginDescription,
                    style: Constant.descriptionTextStyle,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 7,
                  ),
                  BoxTextField(
                    controller: usernameController,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    prefix: SvgPicture.asset(loginPhoneIcon, fit: BoxFit.scaleDown),
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
                  PasswordTextField(
                    controller: passwordController,
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
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<bool>(
                              stream: checkBoxBloc.checked,
                              initialData: false,
                              builder: (context, snapshot) {
                                return Checkbox(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                  value: snapshot.data,
                                  onChanged: (bool? value) {
                                    checkBoxBloc.updateChecked(value!);
                                  },
                                );
                              }),
                          Text(
                            rememberMe,
                            style: Constant.descriptionTextStyle,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => AutoRouter.of(context).push(ForgetPasswordRoute()),
                        child: Text(
                          forgetPassword,
                          style: Constant.forgetPasswordStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 9,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginEmpty) {
                        return CustomButton(
                          onTap: () {
                            if (formGlobalKey.currentState!.validate()) {
                              //   formGlobalKey.currentState!.save();
                              // use the email provided here
                              BlocProvider.of<LoginBloc>(context)
                                  .add(GetLoginData(usernameController.text.toString(), passwordController.text.toString()));

                              // sl<LoginBloc>().add(GetLoginData(usernameController.text.toString(), passwordController.text.toString()));
                            }
                          },
                          width: SizeConfig.screenWidth!,
                          buttonText: login,
                          buttonColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        );
                      } else if (state is LoginLoading) {
                        return CustomButton(
                          onTap: () {},
                          isdisable: true,
                          width: SizeConfig.screenWidth!,
                          buttonText: login,
                          buttonColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        );
                      } else if (state is LoginLoaded) {
                        localRepoImpl.storeToken(state.model.accessToken!);
                        AutoRouter.of(context).replace(const HomeRoute());
                      } else if (state is LoginError) {
                        Fluttertoast.showToast(
                            msg: "Incorrect username and Password !!!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: infoColor,
                            textColor: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
                        return CustomButton(
                          onTap: () {
                            if (formGlobalKey.currentState!.validate()) {
                              //   formGlobalKey.currentState!.save();
                              // use the email provided here
                              BlocProvider.of<LoginBloc>(context)
                                  .add(GetLoginData(usernameController.text.toString(), passwordController.text.toString()));

                              // sl<LoginBloc>().add(GetLoginData(usernameController.text.toString(), passwordController.text.toString()));
                            }
                          },
                          width: SizeConfig.screenWidth!,
                          buttonText: login,
                          buttonColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length > 6;

  bool isPhoneValid(String phone) {
    RegExp regex = new RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(phone);
  }
}
