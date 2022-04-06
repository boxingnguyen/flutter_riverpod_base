import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/common_button.dart';
import 'package:provider_base/common/core/app_color.dart';
import 'package:provider_base/models/reel_model/reel.dart';
import 'package:provider_base/models/reel_model/reel_state_notifier.dart';
import 'package:provider_base/screens/reel/animation_circle.dart';
import '../../common/common_view/common_indicator.dart';
import '../../utils/utils.dart';
import '../login/login_state_notifier.dart';

class ReelActionToolbar extends HookConsumerWidget with Utils {
  const ReelActionToolbar({Key? key, required this.reel}) : super(key: key);
  final double _iconSize = 50;
  final Reel reel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final reelState = ref.watch(reelProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getProfile(ref),
        CommonButton.iconBtn(
          context,
          onPressed: () {
            ref.read(reelProvider.notifier).tapLike();
            ref.read(reelProvider.notifier).isTap();
          },
          iconBtn: const Icon(Icons.favorite),
          colorBtn: !reelState.isLike
              ? AppColor.whileColor
              : AppColor.redColor,
          iconSize: _iconSize,
        ),
        const Text(
          '24325',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CommonButton.iconBtn(context,
            onPressed: () {},
            iconBtn: const Icon(Icons.comment),
            colorBtn: AppColor.whileColor,
            iconSize: _iconSize),
        const Text(
          '1234',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        CommonButton.iconBtn(context,
            onPressed: () {},
            iconBtn: const Icon(Icons.reply),
            colorBtn: AppColor.whileColor,
            iconSize: _iconSize),
        const CircleAnimation(),
        //getAlbum(ref),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget getProfile(WidgetRef ref) {
    final userState = ref.watch(loginProvider);
    return SizedBox(
      height: 55,
      width: 55,
      child: Stack(
        children: [
          CommonIndicator.shapeCircle(
            shapeSize: _iconSize,
            colorBorder: AppColor.whileColor,
            url: userState.userDetail?.photoUrl ??
                'https://picsum.photos/250?image=9', widthBorder: 1,
          ),
          Positioned(
            left: 15,
            bottom: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAlbum(WidgetRef ref){
    //final userState = ref.watch(loginProvider);
    return SizedBox(
      height: 55,
      width: 55,
      child: Stack(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
          ),
          Center(
            child: CommonIndicator.shapeCircle(
              shapeSize: 30,
              colorBorder: AppColor.whileColor,
              url: 'https://picsum.photos/250?image=9', widthBorder: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
