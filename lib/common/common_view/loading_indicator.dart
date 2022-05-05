import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
        ),
      ),
    );
  }
}
