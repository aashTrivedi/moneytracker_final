// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      expenseId: (json['expenseId'] as num).toInt(),
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'expenseId': instance.expenseId,
      'description': instance.description,
      'amount': instance.amount,
      'dateTime': instance.dateTime.toIso8601String(),
      'categoryId': instance.categoryId,
    };
