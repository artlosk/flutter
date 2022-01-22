// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['id'] as int,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'bio': instance.bio,
    };
