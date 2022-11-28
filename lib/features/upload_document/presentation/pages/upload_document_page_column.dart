import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';

class UploadDocumentPageColumn extends StatelessWidget {
  const UploadDocumentPageColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 4,
        ),
        DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          child: Container(
            height: SizeConfig.screenHeight! * 0.2,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal!),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 4),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () {},
                      borderradius: SizeConfig.safeBlockHorizontal! * 2,
                      fontsize: SizeConfig.safeBlockHorizontal! * 3.4,
                      width: SizeConfig.screenWidth! * 0.45,
                      height: SizeConfig.screenHeight! * 0.06,
                      buttonText: "Upload a Document",
                      buttonColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
