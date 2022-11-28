import 'package:flutter/material.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class SettingItemsDetailsPageStateRow extends StatelessWidget {
  const SettingItemsDetailsPageStateRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: "Serial No.",
          color: Colors.black,
          weight: FontWeight.bold,
          scale: 1.2,
        ),
        TextWidget(
          text: "Service Name",
          color: Colors.black,
          weight: FontWeight.bold,
          scale: 1.2,
        ),
        TextWidget(
          text: "Service Type",
          color: Colors.black,
          weight: FontWeight.bold,
          scale: 1.2,
        ),
        TextWidget(
          text: "Rate",
          weight: FontWeight.bold,
          color: Colors.black,
          scale: 1.2,
        ),
      ],
    );
  }
}
