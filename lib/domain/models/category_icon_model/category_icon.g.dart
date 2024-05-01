// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryIconImpl _$$CategoryIconImplFromJson(Map<String, dynamic> json) =>
    _$CategoryIconImpl(
      iconId: (json['iconId'] as num).toInt(),
      localPath: json['localPath'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$CategoryIconImplToJson(_$CategoryIconImpl instance) =>
    <String, dynamic>{
      'iconId': instance.iconId,
      'localPath': instance.localPath,
      'color': instance.color,
    };
