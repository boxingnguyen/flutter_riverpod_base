import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';

class CommonEmptyIndicator extends StatelessWidget {
  const CommonEmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.transparent,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppStyles.black),
          ),
        ),
      ),
    );
  }
}
