import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';

class ButtonUpload extends StatelessWidget {
  const ButtonUpload({
    Key? key,
    required this.label,
    required this.onTap,
    this.colorButton = AppColors.grey6,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colorButton,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppStyles.textBold.copyWith(),
        ),
      ),
    );
  }
}
