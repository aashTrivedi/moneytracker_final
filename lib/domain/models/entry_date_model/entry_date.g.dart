// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryDateImpl _$$EntryDateImplFromJson(Map<String, dynamic> json) =>
    _$EntryDateImpl(
      expenseId: (json['expenseId'] as num).toInt(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$EntryDateImplToJson(_$EntryDateImpl instance) =>
    <String, dynamic>{
      'expenseId': instance.expenseId,
      'dateTime': instance.dateTime.toIso8601String(),
    };
