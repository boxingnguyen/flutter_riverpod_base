import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onEditingComplete,
    this.obscureText = false,
    this.hintText,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final bool obscureText;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.zero,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      style: AppStyles.textRegular,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: AppStyles.bgDarkModeColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: AppStyles.bgDarkModeColor),
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        // use prefixIcon for showing always.
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
    );
  }
}
