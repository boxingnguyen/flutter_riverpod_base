import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel.freezed.dart';
part 'reel.g.dart';

@freezed
class Reel with _$Reel {
  const factory Reel({
    String? description,
    String? sources,
    String? subtitle,
    String? thumb,
    String? title,
    @Default(false) bool isLike,
    @Default(false) bool isTap,
  }) = _Reel;

  factory Reel.fromJson(Map<String, dynamic> json) => _$ReelFromJson(json);
}
