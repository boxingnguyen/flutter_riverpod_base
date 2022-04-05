import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserInfo({
    String? userId,
    String? email,
    String? avatarUrl,
    String? fullName,
  }) = _UserInfo;

  /// Connect the generated [_$UserInfoFromJson] function to the `fromJson`
  /// factory.
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
