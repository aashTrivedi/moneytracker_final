// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsElementImpl _$$StatisticsElementImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsElementImpl(
      categoryTitle: json['categoryTitle'] as String,
      countOfEntries: (json['countOfEntries'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      monthShare: (json['monthShare'] as num).toDouble(),
      icon: CategoryIcon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatisticsElementImplToJson(
        _$StatisticsElementImpl instance) =>
    <String, dynamic>{
      'categoryTitle': instance.categoryTitle,
      'countOfEntries': instance.countOfEntries,
      'totalAmount': instance.totalAmount,
      'monthShare': instance.monthShare,
      'icon': instance.icon.toJson(),
    };
