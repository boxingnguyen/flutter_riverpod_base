import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonButton {
  static Widget customBtn(
      {Color backgroundColor = Colors.white,
      required String label,
      Color labelColor = Colors.blue,
      required Color iconColor,
      required IconData iconData,
      required Function() onTap}) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
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
      BuildContext context, VoidCallback? pressBack, dynamic popValue) {
    return InkWell(
      onTap: pressBack ??
          () {
            Navigator.of(context).pop(popValue);
          },
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

  static Widget iconBtn(BuildContext context,
      {required Function() onPressed,
      required Icon iconBtn,
      required Color colorBtn,
      required double iconSize}) {
    return IconButton(
      onPressed: onPressed,
      icon: iconBtn,
      color: colorBtn,
      iconSize: iconSize,
    );
  }
}
