import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';

class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({
    Key? key,
    this.message,
    this.onTapRetry,
  }) : super(key: key);
  final String? message;
  final VoidCallback? onTapRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? Constants.error,
            style: AppStyles.textRegular,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppStyles.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            child: Text(
              Constants.retry,
              style: AppStyles.textBold.copyWith(
                color: AppStyles.white,
              ),
            ),
            onPressed: onTapRetry,
          ),
        ],
      ),
    );
  }
}
