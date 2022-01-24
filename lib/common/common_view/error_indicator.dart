import 'package:flutter/material.dart';

// TODO(anyone): finish error indicator
class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Retry'),
      ),
    );
  }
}
