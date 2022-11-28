import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/checkbox_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Checkouts",
          textScaleFactor: 1,
        )),
        actions: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 11,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Order Summary",
                  scale: 1.4,
                  weight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Total",
                      scale: 1.2,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    TextWidget(
                      text: "Rs. 3000",
                      scale: 1.2,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                TextWidget(
                  text: "Services Charges",
                  scale: 1.1,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                Divider(),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 6,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: "Tax",
                                scale: 1.2,
                              ),
                              TextWidget(
                                text: "Positive",
                                scale: 1.2,
                              ),
                              TextWidget(
                                text: "13%",
                                scale: 1.2,
                              ),
                              TextWidget(
                                text: "Rs 1200",
                                scale: 1.2,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                Divider(),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Grand Total",
                      scale: 1.3,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: "Rs. 3000",
                      scale: 1.3,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Paid amount",
                      scale: 1.2,
                    ),
                    BoxTextField(
                      width: SizeConfig.screenWidth! * 0.5,
                      readOnly: true,
                      autofocus: false,
                      prefix: SvgPicture.asset(rs, color: Colors.black, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                      textInputAction: TextInputAction.next,
                      hint: "Document Name",
                      initialValue: "100",
                      validator: (name) {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Return amount",
                      scale: 1.2,
                    ),
                    StreamBuilder<bool>(
                        stream: checkBoxBloc.checked,
                        initialData: false,
                        builder: (context, snapshot) {
                          return Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                value: snapshot.data,
                                onChanged: (bool? value) {
                                  checkBoxBloc.updateChecked(value!);
                                },
                              ),
                              TextWidget(
                                text: "As Discount",
                                scale: 1.1,
                              ),
                            ],
                          );
                        }),
                  ],
                ),
                BoxTextField(
                  width: SizeConfig.screenWidth! * 0.5,
                  readOnly: true,
                  autofocus: false,
                  prefix: SvgPicture.asset(rs, color: Colors.black, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                  textInputAction: TextInputAction.next,
                  hint: "Document Name",
                  initialValue: "200",
                  validator: (name) {},
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
                  buttonText: "Pay",
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
