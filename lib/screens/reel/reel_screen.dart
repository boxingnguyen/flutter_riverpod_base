import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/models/reel_model/reel_data.dart';
import 'package:provider_base/models/reel_model/reel_state_notifier.dart';
import 'reel_bottom_bar.dart';
import 'reels_action_toolbar.dart';
import 'reel_video_action.dart';

class ReelScreen extends HookConsumerWidget {
  const ReelScreen({Key? key}) : super(key: key);

  static const routeName = '/reel_screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Reels',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo_camera_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: reelData.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      GestureDetector(
                        onDoubleTap: (){
                          ref.read(reelProvider.notifier).tapLike();
                          ref.read(reelProvider.notifier).isTap();
                        },
                        child: ReelVideoAction(
                          reel: reelData[index],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                  flex: 14,
                                  child: ReelBottomBar(
                                    reel: reelData[index],
                                  )),
                              Flexible(
                                  flex: 3,
                                  child: ReelActionToolbar(
                                    reel: reelData[index],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
