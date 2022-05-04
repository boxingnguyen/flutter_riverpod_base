import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;
  const ShimmerWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.shapeBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          color: AppStyles.primaryColor,
          shape: shapeBorder,
        ),
      ),
      baseColor: AppStyles.bgLightModeColor,
      highlightColor: AppStyles.primaryColor,
    );
  }
}
