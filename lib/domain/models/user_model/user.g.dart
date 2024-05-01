// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      pin: json['pin'] as String,
      biometrics: json['biometrics'] as bool,
      avatarLocalPath: json['avatarLocalPath'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'pin': instance.pin,
      'biometrics': instance.biometrics,
      'avatarLocalPath': instance.avatarLocalPath,
    };
