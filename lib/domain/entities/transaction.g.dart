// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String?,
      uid: json['uid'] as String,
      transactionTime: (json['transactionTime'] as num?)?.toInt(),
      transactionImage: json['transactionImage'] as String?,
      title: json['title'] as String,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      theaterName: json['theaterName'] as String?,
      watchingName: (json['watchingName'] as num?)?.toInt(),
      ticketAmount: (json['ticketAmount'] as num?)?.toInt(),
      ticketPrice: (json['ticketPrice'] as num?)?.toInt(),
      adminfee: (json['adminfee'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'transactionTime': instance.transactionTime,
      'transactionImage': instance.transactionImage,
      'title': instance.title,
      'seats': instance.seats,
      'theaterName': instance.theaterName,
      'watchingName': instance.watchingName,
      'ticketAmount': instance.ticketAmount,
      'ticketPrice': instance.ticketPrice,
      'adminfee': instance.adminfee,
      'total': instance.total,
    };
