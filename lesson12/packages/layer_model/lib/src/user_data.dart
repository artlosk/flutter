import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData(
      {required int id,
      required String firstname,
      required String lastname,
      required String email,
      required String bio}) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
    // return UserData(
    //   id: json['id'],
    //   firstname: json['firstname'],
    //   lastname: json['lastname'],
    //   email: json['email'],
    // );
  // }
}
