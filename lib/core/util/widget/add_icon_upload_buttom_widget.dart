import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button_with_icon.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class AddIconUploadButtomWidget extends StatelessWidget {
  const AddIconUploadButtomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: SizeConfig.screenHeight! * 0.14,
              width: SizeConfig.screenWidth! * 0.3,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3)),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 8,
            ),
            CustomButtonIcon(
              onTap: () {},
              width: SizeConfig.screenWidth! * 0.3,
              height: SizeConfig.screenHeight! * 0.05,
              buttonText: "Upload",
              buttonColor: Colors.white,
              borderColor: Colors.grey,
              textColor: Colors.black,
              icon: upload,
              iconColor: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 4,
        ),
        TextWidget(text: "Note: Image size 100x100 only.", scale: 1.1),
      ],
    );
  }
}
