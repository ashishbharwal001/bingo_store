// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int?,
    orderId: json['orderId'] as String?,
    productImage: json['productImage'] as String?,
    date: json['date'] as String?,
    time: json['time'] as String?,
    status: json['status'] as String?,
    shippingStatus: json['shippingStatus'] as String?,
    amount: json['amount'] as String?,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'productImage': instance.productImage,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'shippingStatus': instance.shippingStatus,
      'amount': instance.amount,
    };
