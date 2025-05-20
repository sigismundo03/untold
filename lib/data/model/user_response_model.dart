import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final int? id;
  final String? username;
  final String? email;
  final String? provider;
  final bool? confirmed;
  @JsonKey(name: 'firebase_UID')
  final String? firebaseUID;
  @JsonKey(name: 'finished_onboarding')
  final bool? finishedOnboarding;
  @JsonKey(name: 'plan_renew_date')
  final String? planRenewDate;
  @JsonKey(name: 'plan_status')
  final String? planStatus;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  UserResponseModel({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.firebaseUID,
    this.finishedOnboarding,
    this.planRenewDate,
    this.planStatus,
    this.profilePicture,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
