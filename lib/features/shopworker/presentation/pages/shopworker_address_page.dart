import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/checkbox_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ShopworkerAddressPage extends StatelessWidget {
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
              text: "Permanent Address",
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
              height: SizeConfig.safeBlockHorizontal! * 4,
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
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "Address", scale: 1.3),
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal! * 4,
                            ),
                            BoxTextField(
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              hint: "Address",
                              validator: (name) {},
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
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
          ],
        ),
      ),
    );
  }
}
