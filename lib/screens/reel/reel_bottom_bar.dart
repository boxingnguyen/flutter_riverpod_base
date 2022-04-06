import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/models/reel_model/reel.dart';
import '../../common/common_view/common_indicator.dart';
import '../../common/core/app_color.dart';
import '../../utils/utils.dart';
import '../login/login_state_notifier.dart';

class ReelBottomBar extends HookConsumerWidget with Utils {
  ReelBottomBar({Key? key, required this.reel}) : super(key: key);

  final Reel reel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(loginProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          title: Row(
            children: [
              Text(userState.userDetail?.displayName ?? ''),
              const Text(
                ' - Follow',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          leading: CommonIndicator.imageCircle(
              AppColor.whileColor,
              18,
              userState.userDetail?.photoUrl ??
                  'https://picsum.photos/250?image=9'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ExpandableText(
            '${reel.description}',
            style: const TextStyle(
                fontSize: 12.5,
                color: Colors.white,
                fontWeight: FontWeight.w400),
            expandText: 'more',
            collapseText: 'lest',
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 1,
            linkColor: Colors.grey,
          ),
        ),
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 5,
          title: //reel.isTagged
              //true ?
              Row(
            children: [
              SizedBox(
                height: 20,
                width: 125,
                child: Marquee(
                  text: '${reel.subtitle}',
                  scrollAxis: Axis.horizontal,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          leading: const Icon(Icons.graphic_eq_outlined,
              size: 16, color: Colors.white),
        ),
      ],
    );
  }
}
