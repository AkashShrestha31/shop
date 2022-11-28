import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/features/upload_document/presentation/pages/upload_document_page_column.dart';

class UploadDocumentWidget extends StatefulWidget {
  @override
  State<UploadDocumentWidget> createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  List<UploadDocumentPageColumn> upload = [UploadDocumentPageColumn()];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Upload Your Documents",
            scale: 1.4,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 4,
          ),
          TextWidget(text: "Document Name", scale: 1.3),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 4,
          ),
          BoxTextField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            hint: "Document Name",
            validator: (name) {},
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 6,
          ),
          TextWidget(text: "Document Type", scale: 1.3),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 4,
          ),
          CustomDropdownButton2(
            buttonWidth: SizeConfig.screenWidth!,
            buttonHeight: SizeConfig.screenHeight! * 0.06,
            dropdownWidth: SizeConfig.screenWidth! * 0.9,
            hint: "Select Document Type",
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
          TextWidget(text: "Upload a Document", scale: 1.3),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: upload.length,
              itemBuilder: (context, i) {
                return upload[i];
              }),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 4,
          ),
          TextButton.icon(
            // <-- TextButton
            onPressed: () {
              upload.add(UploadDocumentPageColumn());
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              size: SizeConfig.safeBlockHorizontal! * 5,
              color: Theme.of(context).primaryColor,
            ),
            label: TextWidget(
              text: "Add Documents",
              scale: SizeConfig.safeBlockHorizontal! * 0.27,
              weight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal! * 15,
          ),
        ],
      ),
    );
  }
}
