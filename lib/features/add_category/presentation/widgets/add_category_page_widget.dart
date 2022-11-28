import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

import '../../../../core/util/widget/add_icon_upload_buttom_widget.dart';
import '../../../../core/util/widget/name_and_status_widget.dart';

class AddCategoryPageWidget extends StatelessWidget {
  const AddCategoryPageWidget({Key? key, required this.status, required this.name}) : super(key: key);
  final String? name;
  final List<String> status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: "Add icon", scale: 1.3),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 4,
        ),
        AddIconUploadButtomWidget(),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal! * 6,
        ),
        NameAndStatusWidget(name: name, status: status),
      ],
    );
  }
}
