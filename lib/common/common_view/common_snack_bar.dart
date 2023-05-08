import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';

class CommonSnackBar extends StatelessWidget {
  const CommonSnackBar({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: AppStyles.bgDarkModeColor,
        child: Text(
          message,
          style: AppStyles.textMedium.copyWith(color: AppStyles.green),
        ),
      ),
    );
  }
}
