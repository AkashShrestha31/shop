import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/util/widget/dropdown/dropdown_button2.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;

  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.grey,
            ),
            textScaleFactor: 1.1,
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.black),
                      textScaleFactor: 1.2,
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.arrow_drop_down_sharp),
        iconSize: iconSize ?? SizeConfig.safeBlockHorizontal! * 7,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding: buttonPadding ?? EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              color: Constant.textFieldBackgroundColor,
              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3),
              // border: Border.all(
              //   color: Colors.white,
              // ),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,
        dropdownWidth: dropdownWidth ?? SizeConfig.screenWidth,
        dropdownPadding: dropdownPadding,

        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}
