import 'package:json_annotation/json_annotation.dart';

part 'UsersModel.g.dart';

@JsonSerializable()
class UsersModel {
  String access_token;
  String expired_date;
  String user_type;

  UsersModel(
      {
        this.access_token,
        this.expired_date,
        this.user_type,
      });

  @override
  String toString() {
    return 'UsersModel{access_token: $access_token, expired_date: $expired_date, user_type: $user_type}';
  }

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
