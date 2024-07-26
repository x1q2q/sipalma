import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing.g.dart';
part 'billing.freezed.dart';

@freezed
class Billing with _$Billing {
  const factory Billing(
      {required int id,
       required String title,
      @JsonKey(name: 'total_amount') required int totalAmount,
      @JsonKey(name: 'created_at') required String createdAt}) = _Billing;
  factory Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);
}
