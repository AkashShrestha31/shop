import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/constant.dart';

class PasswordTextField extends StatefulWidget {
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
  final IconData? suffix;
  final Widget? prefix;
  final String? hint;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  PasswordTextField(
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
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  Icon suffix = Icon(FontAwesomeIcons.eyeSlash);
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
          suffixIcon: IconButton(
            iconSize: SizeConfig.safeBlockHorizontal! * 4,
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
                if (_obscureText == true) {
                  suffix = const Icon(FontAwesomeIcons.eyeSlash);
                } else {
                  suffix = const Icon(FontAwesomeIcons.eye);
                }
              });
            },
            icon: suffix,
          ),
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
