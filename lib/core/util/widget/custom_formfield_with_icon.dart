import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';

class CustomFormFieldWithIcon extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? obsecure;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hint;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  CustomFormFieldWithIcon(
      {Key? key,
      this.controller,
      this.obsecure,
      required this.validator,
      this.focusNode,
      this.textInputAction,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.hint,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      this.onChanged})
      : super(key: key);

  @override
  State<CustomFormFieldWithIcon> createState() => _CustomFormFieldWithIconState();
}

class _CustomFormFieldWithIconState extends State<CustomFormFieldWithIcon> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingCompleted,
        autofocus: widget.autofocus!,
        minLines: widget.isMulti! ? 4 : 1,
        maxLines: widget.isMulti! ? null : 1,
        onTap: widget.onTap,
        enabled: widget.enabled,
        readOnly: widget.readOnly!,
        obscureText: false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint!,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true, //<-- SEE HERE
          fillColor: Constant.textFieldBackgroundColor,
          errorText: widget.errorText,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          labelStyle: TextStyle(),
          labelText: widget.label,
          contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal! * 3, horizontal: SizeConfig.safeBlockHorizontal! * 6),
          enabledBorder: Constant.kEnableBoarder,
          border: InputBorder.none,
          focusedBorder: Constant.kFocusedBoarder,
          errorBorder: Constant.kErrorboarder,
          focusedErrorBorder: Constant.kFocusedBoarder,
        ),
        validator: widget.validator);
  }
}
