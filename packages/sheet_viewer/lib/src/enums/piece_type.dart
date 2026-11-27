import 'package:freezed_annotation/freezed_annotation.dart';
@JsonEnum(alwaysCreate: true)
enum PieceType {
  @JsonValue('NORMAL')
  normal,
  @JsonValue('UNUSED')
  unused,
}
