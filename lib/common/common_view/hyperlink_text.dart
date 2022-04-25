import 'package:flutter/material.dart';

class HyperLinkText extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  const HyperLinkText({Key? key, required this.text, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        text,
        style: const TextStyle(
            decoration: TextDecoration.underline, color: Colors.blue),
      ),
    );
  }
}
