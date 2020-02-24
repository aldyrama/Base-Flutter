// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return UsersModel(
      access_token: json['access_token'] as String,
      expired_date: json['expired_date'] as String,
      user_type: json['user_type'] as String);
}

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'expired_date': instance.expired_date,
      'user_type': instance.user_type
    };
