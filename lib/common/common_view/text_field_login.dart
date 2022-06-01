import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';

typedef TextFieldChange = void Function(String value);

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.focusScopeNode,
    this.isObscure = false,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.hinText,
    this.labelText,
    this.errorText,
    this.suffixIcon,
    this.height,
    this.fillColor,
    this.onTextFieldChange,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputAction textInputAction;
  final FocusScopeNode? focusScopeNode;
  final bool isObscure;
  final bool enabled;
  final TextAlign textAlign;
  final String? hinText;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final double? height;
  final Color? fillColor;
  final TextFieldChange? onTextFieldChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppStyles.black)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        style: AppStyles.textRegular,
        keyboardType: keyboardType,
        onChanged: onTextFieldChange,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        maxLines: maxLines,
        textInputAction: textInputAction,
        obscureText: isObscure,
        maxLength: Constants.otherFieldMaxLength100,
        enabled: enabled,
        textAlign: textAlign,
        decoration: enabled
            ? _inputDecoration(errorText: errorText)
            : _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration({String? errorText}) {
    return InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      labelText: labelText,
      hintText: hinText,
      hintStyle: AppStyles.textRegular.copyWith(
        color: AppStyles.grey6,
      ),
      errorText: errorText,
      suffixIcon: suffixIcon ?? const SizedBox(),
      counterText: '',
    );
  }
}
