// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      provider: json['provider'] as String?,
      confirmed: json['confirmed'] as bool?,
      firebaseUID: json['firebase_UID'] as String?,
      finishedOnboarding: json['finished_onboarding'] as bool?,
      planRenewDate: json['plan_renew_date'] as String?,
      planStatus: json['plan_status'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'firebase_UID': instance.firebaseUID,
      'finished_onboarding': instance.finishedOnboarding,
      'plan_renew_date': instance.planRenewDate,
      'plan_status': instance.planStatus,
      'profile_picture': instance.profilePicture,
    };
