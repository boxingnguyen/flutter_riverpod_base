import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserDetail with _$UserDetail {
  factory UserDetail({
    String? email,
    String? photoUrl,
    String? displayName,
  }) = _UserDetail;


  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}