import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';

class BoxTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final String? initialValue;
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
  final double? width;
  final Widget? prefix;
  final String? hint;
  final TextInputAction? textInputAction;
  BoxTextField(
      {Key? key,
      this.initialValue,
      this.controller,
      this.obsecure,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.textInputAction,
      this.width,
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
  State<BoxTextField> createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? SizeConfig.screenWidth!,
      child: TextFormField(
          initialValue: widget.initialValue,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingCompleted,
          autofocus: widget.autofocus!,
          minLines: widget.isMulti! ? 4 : 1,
          maxLines: widget.isMulti! ? 4 : 1,
          onTap: widget.onTap,
          enabled: widget.enabled,
          readOnly: widget.readOnly!,
          obscureText: _obscureText,
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
          validator: widget.validator),
    );
  }
}
