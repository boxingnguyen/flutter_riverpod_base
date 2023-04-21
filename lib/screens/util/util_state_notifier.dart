import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/api/api_client.dart';
import 'package:provider_base/common/core/data/local_storage.dart';
import 'package:provider_base/screens/util/util_state.dart';
import 'package:provider_base/utils/utils.dart';

final utilNotifierProvider =
    StateNotifierProvider<UtilStateNotifier, UtilState>((ref) {
  return UtilStateNotifier(ref);
});

class UtilStateNotifier extends StateNotifier<UtilState> with Utils {
  UtilStateNotifier(this.ref) : super(UtilState());
  Ref ref;
  
  Future<void> fetchData() async {
    state = state.copyWith(showLoadingIndicator: true);
    final response = await apiClient(ref).postDummyDataRequest();

    if (response is Map) {
      await LocalStorage.saveAccessToken(response['token']);
      await LocalStorage.saveExpiredAt(response['expired_at']);

      state = state.copyWith(
        status: 'Successful',
        showLoadingIndicator: false,
      );
    } else {
      state = state.copyWith(
        status: 'Fail',
        showLoadingIndicator: false,
      );
    }
  }
}
