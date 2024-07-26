import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.g.dart';
part 'announcement.freezed.dart';

@freezed
class Announcement with _$Announcement {
  const factory Announcement(
      {required int id,
      @JsonKey(name: 'created_by') required String createdBy,
      required String content,
      @JsonKey(name: 'created_at') required String createdAt}) = _Announcement;
  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);
}
