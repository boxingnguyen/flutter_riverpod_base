import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/utils/utils.dart';

class CommonButton with Utils {
  static Widget customBtn({
    Color backgoundColor = Colors.white,
    required String label,
    Color labelColor = Colors.blue,
    required Color iconColor,
    required IconData iconData,
    required Function() onTap,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgoundColor),
      ),
      onPressed: onTap,
      icon: FaIcon(
        iconData,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }

  static Widget backBtn(
    BuildContext context,
    VoidCallback? pressBack,
    dynamic popValue,
  ) {
    return InkWell(
      onTap: pressBack ?? () => Navigator.of(context).pop(popValue),
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 20,
      ),
    );
  }

  static Widget closeBtn(BuildContext context, dynamic popValue) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(popValue),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: const Icon(Icons.close, size: 20),
      ),
    );
  }

  static Widget submitBtn(String title, void Function()? onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppStyles.primaryColor,
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(
          fontSize: AppStyles.fontSizeL,
          fontWeight: FontWeight.bold,
        ),

        shape: const StadiumBorder(),
        // if need fixed size,
        // shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(36),
        // ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
