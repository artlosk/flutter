// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
class _$UserDataTearOff {
  const _$UserDataTearOff();

  _UserData call(
      {required int id,
      required String firstname,
      required String lastname,
      required String email,
      required String bio}) {
    return _UserData(
      id: id,
      firstname: firstname,
      lastname: lastname,
      email: email,
      bio: bio,
    );
  }

  UserData fromJson(Map<String, Object?> json) {
    return UserData.fromJson(json);
  }
}

/// @nodoc
const $UserData = _$UserDataTearOff();

/// @nodoc
mixin _$UserData {
  int get id => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {int id, String firstname, String lastname, String email, String bio});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) then) =
      __$UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String firstname, String lastname, String email, String bio});
}

/// @nodoc
class __$UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(_UserData _value, $Res Function(_UserData) _then)
      : super(_value, (v) => _then(v as _UserData));

  @override
  _UserData get _value => super._value as _UserData;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? bio = freezed,
  }) {
    return _then(_UserData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData implements _UserData {
  _$_UserData(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.bio});

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final int id;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;
  @override
  final String bio;

  @override
  String toString() {
    return 'UserData(id: $id, firstname: $firstname, lastname: $lastname, email: $email, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.bio, bio));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(bio));

  @JsonKey(ignore: true)
  @override
  _$UserDataCopyWith<_UserData> get copyWith =>
      __$UserDataCopyWithImpl<_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(this);
  }
}

abstract class _UserData implements UserData {
  factory _UserData(
      {required int id,
      required String firstname,
      required String lastname,
      required String email,
      required String bio}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  int get id;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get email;
  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$UserDataCopyWith<_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
