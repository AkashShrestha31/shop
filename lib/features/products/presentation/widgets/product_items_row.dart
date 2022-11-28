import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ProductItemsRow extends StatelessWidget {
  const ProductItemsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth! * 0.3,
          child: TextWidget(
            text: "Product name",
            color: Colors.black,
            weight: FontWeight.bold,
            scale: 1.2,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.26,
          child: TextWidget(
            text: "Category",
            color: Colors.black,
            weight: FontWeight.bold,
            scale: 1.2,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.18,
          child: TextWidget(
            text: "Brand",
            color: Colors.black,
            weight: FontWeight.bold,
            scale: 1.2,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.18,
          child: TextWidget(
            text: "Quantity",
            weight: FontWeight.bold,
            color: Colors.black,
            scale: 1.2,
          ),
        ),
      ],
    );
  }
}
