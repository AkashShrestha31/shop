import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/checkbox_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Edit Profile",
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 6),
              child: Column(
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
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 6,
                  ),
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
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 6,
                  ),
                  TextWidget(
                    text: "Permanent Address",
                    scale: 1.4,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 4,
                  ),
                  TextWidget(text: state, scale: 1.3),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 4,
                  ),
                  CustomDropdownButton2(
                    buttonWidth: SizeConfig.screenWidth!,
                    buttonHeight: SizeConfig.screenHeight! * 0.06,
                    dropdownWidth: SizeConfig.screenWidth! * 0.9,
                    hint: 'Select Region',
                    dropdownItems: [],
                    value: null,
                    onChanged: (value) {
                      // setState(() {
                      //   selectedValue = value;
                      // });
                    },
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
                          TextWidget(text: city, scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BoxTextField(
                            width: SizeConfig.screenWidth! * 0.4,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            hint: city,
                            validator: (name) {},
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: area, scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BoxTextField(
                            width: SizeConfig.screenWidth! * 0.4,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            hint: area,
                            validator: (name) {},
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 6,
                  ),
                  TextWidget(text: address, scale: 1.3),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 4,
                  ),
                  BoxTextField(
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    hint: address,
                    validator: (name) {},
                  ),
                  StreamBuilder<bool>(
                      stream: checkBoxBloc.checked,
                      initialData: false,
                      builder: (context, snapshot) {
                        print(snapshot.data!);
                        if (!snapshot.data!) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 6,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                    value: snapshot.data!,
                                    onChanged: (bool? value) {
                                      checkBoxBloc.updateChecked(value!);
                                    },
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal! * 4,
                                  ),
                                  TextWidget(
                                    text: sameaspermanent,
                                    scale: 1.3,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 6,
                              ),
                              TextWidget(
                                text: "Temporary Address",
                                scale: 1.4,
                                color: Colors.black,
                                weight: FontWeight.w500,
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
                                      TextWidget(text: city, scale: 1.3),
                                      SizedBox(
                                        height: SizeConfig.safeBlockHorizontal! * 4,
                                      ),
                                      BoxTextField(
                                        width: SizeConfig.screenWidth! * 0.4,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        hint: city,
                                        validator: (name) {},
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(text: area, scale: 1.3),
                                      SizedBox(
                                        height: SizeConfig.safeBlockHorizontal! * 4,
                                      ),
                                      BoxTextField(
                                        width: SizeConfig.screenWidth! * 0.4,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        hint: area,
                                        validator: (name) {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 6,
                              ),
                              TextWidget(text: address, scale: 1.3),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 4,
                              ),
                              BoxTextField(
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                hint: address,
                                validator: (name) {},
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal! * 6,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                  value: snapshot.data!,
                                  onChanged: (bool? value) {
                                    checkBoxBloc.updateChecked(value!);
                                  },
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal! * 4,
                                ),
                                TextWidget(
                                  text: sameaspermanent,
                                  scale: 1.3,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 15,
                  ),
                ],
              ),
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
