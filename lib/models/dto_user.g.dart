// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'dto_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOUser _$DTOUserFromJson(Map<String, dynamic> json) => DTOUser(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      lastSessions: (json['lastSessions'] as List<dynamic>?)
          ?.map((e) => LastSessions.fromJson(e as Map<String, dynamic>))
          .toList(),
      nearby: (json['nearby'] as List<dynamic>?)
          ?.map((e) => Nearby.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DTOUserToJson(DTOUser instance) => <String, dynamic>{
      'user': instance.user,
      'lastSessions': instance.lastSessions,
      'nearby': instance.nearby,
    };
