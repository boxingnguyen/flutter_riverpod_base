import 'package:flutter/material.dart';

// TODO(anyone): finish error indicator
class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({Key? key, this.onTapRetry}) : super(key: key);

  final VoidCallback? onTapRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTapRetry ?? () {},
        child: const Text('Retry'),
      ),
    );
  }
}
