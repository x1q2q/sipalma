// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillingImpl _$$BillingImplFromJson(Map<String, dynamic> json) =>
    _$BillingImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      totalAmount: (json['total_amount'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$BillingImplToJson(_$BillingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'total_amount': instance.totalAmount,
      'created_at': instance.createdAt,
    };
