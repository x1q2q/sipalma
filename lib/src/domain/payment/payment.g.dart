// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      status: json['status'] as String,
      total: (json['total'] as num).toInt(),
      imageProof: json['image_proof'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'total': instance.total,
      'image_proof': instance.imageProof,
      'created_at': instance.createdAt,
    };
