import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/colors.dart';

class OtpFieldStyle {
  /// The background color for outlined box.
  final Color backgroundColor;

  /// The border color text field.
  final Color borderColor;

  /// The border color of text field when in focus.
  final Color focusBorderColor;

  /// The border color of text field when disabled.
  final Color disabledBorderColor;

  /// The border color of text field when in focus.
  final Color enabledBorderColor;

  /// The border color of text field when disabled.
  final Color errorBorderColor;

  OtpFieldStyle(
      {this.backgroundColor: Colors.transparent,
      this.borderColor: const Color(0xFFF3F4F8),
      this.focusBorderColor: infoColor,
      this.disabledBorderColor: const Color(0xFFF3F4F8),
      this.enabledBorderColor: const Color(0xFFF3F4F8),
      this.errorBorderColor: Colors.red});
}
