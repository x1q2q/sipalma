import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';
part 'payment.freezed.dart';

@freezed
class Payment with _$Payment {
  const factory Payment(
      {required int id,
      required String title,
      required String status,
      required int total,
      @JsonKey(name: 'image_proof') required String imageProof,
      @JsonKey(name: 'created_at') required String createdAt}) = _Payment;
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
