// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryCategoryImpl _$$EntryCategoryImplFromJson(Map<String, dynamic> json) =>
    _$EntryCategoryImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String,
      orderNum: (json['orderNum'] as num).toInt(),
      icon: CategoryIcon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EntryCategoryImplToJson(_$EntryCategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'type': instance.type,
      'orderNum': instance.orderNum,
      'icon': instance.icon.toJson(),
    };
