import 'package:flutter/material.dart';

// TODO(anyone): finish error indicator
class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({Key? key, this.onTapRetry, this.message})
      : super(key: key);

  final VoidCallback? onTapRetry;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTapRetry,
        child: Text(message ?? 'Retry'),
      ),
    );
  }
}
