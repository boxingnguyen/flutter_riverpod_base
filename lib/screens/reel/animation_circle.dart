import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/common_indicator.dart';
import 'package:provider_base/common/core/app_color.dart';


class CircleAnimation extends StatefulWidget {
  const CircleAnimation({Key? key}) : super(key: key);

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, Widget? child) {
          return Transform.rotate(
            angle: _animationController.value * 2 * math.pi,
            child: child,
          );
        },
        child: SizedBox(
          height: 55,
          width: 55,
          child: Stack(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.4,
                      0.6,
                      0.8,
                    ],
                    colors: [
                      Colors.black,
                      Colors.grey,
                      Colors.grey,
                      Colors.black,
                    ],
                  ),
                    shape: BoxShape.circle, ),
              ),
              Center(
                child: CommonIndicator.shapeCircle(
                  shapeSize: 30,
                  colorBorder: AppColor.whileColor,
                  url: 'https://picsum.photos/250?image=9',
                  widthBorder: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
