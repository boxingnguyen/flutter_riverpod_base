
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/models/reel_model/reel.dart';



final reelProvider = StateNotifierProvider<ReelStateNotifier, Reel>(
        (_) => ReelStateNotifier());
class ReelStateNotifier extends StateNotifier<Reel> {
  ReelStateNotifier() : super(const Reel());

  void tapLike(){
    final bool isLike = state.isLike;
    state = state.copyWith(isLike: !isLike);
  }

  void isTap(){
    final bool isTap = state.isTap;
    state = state.copyWith(isTap: !isTap);
  }
}