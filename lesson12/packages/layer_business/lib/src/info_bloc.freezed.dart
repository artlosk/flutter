// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InfoBlocStateTearOff {
  const _$InfoBlocStateTearOff();

  InfoLoadingState loading() {
    return const InfoLoadingState();
  }

  InfoLoadedState loaded({required UserData userData}) {
    return InfoLoadedState(
      userData: userData,
    );
  }
}

/// @nodoc
const $InfoBlocState = _$InfoBlocStateTearOff();

/// @nodoc
mixin _$InfoBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoLoadingState value) loading,
    required TResult Function(InfoLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoBlocStateCopyWith<$Res> {
  factory $InfoBlocStateCopyWith(
          InfoBlocState value, $Res Function(InfoBlocState) then) =
      _$InfoBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoBlocStateCopyWithImpl<$Res>
    implements $InfoBlocStateCopyWith<$Res> {
  _$InfoBlocStateCopyWithImpl(this._value, this._then);

  final InfoBlocState _value;
  // ignore: unused_field
  final $Res Function(InfoBlocState) _then;
}

/// @nodoc
abstract class $InfoLoadingStateCopyWith<$Res> {
  factory $InfoLoadingStateCopyWith(
          InfoLoadingState value, $Res Function(InfoLoadingState) then) =
      _$InfoLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoLoadingStateCopyWithImpl<$Res>
    extends _$InfoBlocStateCopyWithImpl<$Res>
    implements $InfoLoadingStateCopyWith<$Res> {
  _$InfoLoadingStateCopyWithImpl(
      InfoLoadingState _value, $Res Function(InfoLoadingState) _then)
      : super(_value, (v) => _then(v as InfoLoadingState));

  @override
  InfoLoadingState get _value => super._value as InfoLoadingState;
}

/// @nodoc

class _$InfoLoadingState implements InfoLoadingState {
  const _$InfoLoadingState();

  @override
  String toString() {
    return 'InfoBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InfoLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoLoadingState value) loading,
    required TResult Function(InfoLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InfoLoadingState implements InfoBlocState {
  const factory InfoLoadingState() = _$InfoLoadingState;
}

/// @nodoc
abstract class $InfoLoadedStateCopyWith<$Res> {
  factory $InfoLoadedStateCopyWith(
          InfoLoadedState value, $Res Function(InfoLoadedState) then) =
      _$InfoLoadedStateCopyWithImpl<$Res>;
  $Res call({UserData userData});

  $UserDataCopyWith<$Res> get userData;
}

/// @nodoc
class _$InfoLoadedStateCopyWithImpl<$Res>
    extends _$InfoBlocStateCopyWithImpl<$Res>
    implements $InfoLoadedStateCopyWith<$Res> {
  _$InfoLoadedStateCopyWithImpl(
      InfoLoadedState _value, $Res Function(InfoLoadedState) _then)
      : super(_value, (v) => _then(v as InfoLoadedState));

  @override
  InfoLoadedState get _value => super._value as InfoLoadedState;

  @override
  $Res call({
    Object? userData = freezed,
  }) {
    return _then(InfoLoadedState(
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }

  @override
  $UserDataCopyWith<$Res> get userData {
    return $UserDataCopyWith<$Res>(_value.userData, (value) {
      return _then(_value.copyWith(userData: value));
    });
  }
}

/// @nodoc

class _$InfoLoadedState implements InfoLoadedState {
  const _$InfoLoadedState({required this.userData});

  @override
  final UserData userData;

  @override
  String toString() {
    return 'InfoBlocState.loaded(userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InfoLoadedState &&
            (identical(other.userData, userData) ||
                const DeepCollectionEquality()
                    .equals(other.userData, userData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userData);

  @JsonKey(ignore: true)
  @override
  $InfoLoadedStateCopyWith<InfoLoadedState> get copyWith =>
      _$InfoLoadedStateCopyWithImpl<InfoLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) {
    return loaded(userData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
  }) {
    return loaded?.call(userData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoLoadingState value) loading,
    required TResult Function(InfoLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoLoadingState value)? loading,
    TResult Function(InfoLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InfoLoadedState implements InfoBlocState {
  const factory InfoLoadedState({required UserData userData}) =
      _$InfoLoadedState;

  UserData get userData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoLoadedStateCopyWith<InfoLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$InfoBlocEventTearOff {
  const _$InfoBlocEventTearOff();

  _InfoInitEvent init() {
    return const _InfoInitEvent();
  }

  _InfoBlocEvent getUser({required UserData user}) {
    return _InfoBlocEvent(
      user: user,
    );
  }
}

/// @nodoc
const $InfoBlocEvent = _$InfoBlocEventTearOff();

/// @nodoc
mixin _$InfoBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserData user) getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InfoInitEvent value) init,
    required TResult Function(_InfoBlocEvent value) getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoBlocEventCopyWith<$Res> {
  factory $InfoBlocEventCopyWith(
          InfoBlocEvent value, $Res Function(InfoBlocEvent) then) =
      _$InfoBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoBlocEventCopyWithImpl<$Res>
    implements $InfoBlocEventCopyWith<$Res> {
  _$InfoBlocEventCopyWithImpl(this._value, this._then);

  final InfoBlocEvent _value;
  // ignore: unused_field
  final $Res Function(InfoBlocEvent) _then;
}

/// @nodoc
abstract class _$InfoInitEventCopyWith<$Res> {
  factory _$InfoInitEventCopyWith(
          _InfoInitEvent value, $Res Function(_InfoInitEvent) then) =
      __$InfoInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$InfoInitEventCopyWithImpl<$Res>
    extends _$InfoBlocEventCopyWithImpl<$Res>
    implements _$InfoInitEventCopyWith<$Res> {
  __$InfoInitEventCopyWithImpl(
      _InfoInitEvent _value, $Res Function(_InfoInitEvent) _then)
      : super(_value, (v) => _then(v as _InfoInitEvent));

  @override
  _InfoInitEvent get _value => super._value as _InfoInitEvent;
}

/// @nodoc

class _$_InfoInitEvent implements _InfoInitEvent {
  const _$_InfoInitEvent();

  @override
  String toString() {
    return 'InfoBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InfoInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserData user) getUser,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InfoInitEvent value) init,
    required TResult Function(_InfoBlocEvent value) getUser,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InfoInitEvent implements InfoBlocEvent {
  const factory _InfoInitEvent() = _$_InfoInitEvent;
}

/// @nodoc
abstract class _$InfoBlocEventCopyWith<$Res> {
  factory _$InfoBlocEventCopyWith(
          _InfoBlocEvent value, $Res Function(_InfoBlocEvent) then) =
      __$InfoBlocEventCopyWithImpl<$Res>;
  $Res call({UserData user});

  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$InfoBlocEventCopyWithImpl<$Res>
    extends _$InfoBlocEventCopyWithImpl<$Res>
    implements _$InfoBlocEventCopyWith<$Res> {
  __$InfoBlocEventCopyWithImpl(
      _InfoBlocEvent _value, $Res Function(_InfoBlocEvent) _then)
      : super(_value, (v) => _then(v as _InfoBlocEvent));

  @override
  _InfoBlocEvent get _value => super._value as _InfoBlocEvent;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_InfoBlocEvent(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }

  @override
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_InfoBlocEvent implements _InfoBlocEvent {
  const _$_InfoBlocEvent({required this.user});

  @override
  final UserData user;

  @override
  String toString() {
    return 'InfoBlocEvent.getUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InfoBlocEvent &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$InfoBlocEventCopyWith<_InfoBlocEvent> get copyWith =>
      __$InfoBlocEventCopyWithImpl<_InfoBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserData user) getUser,
  }) {
    return getUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
  }) {
    return getUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserData user)? getUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InfoInitEvent value) init,
    required TResult Function(_InfoBlocEvent value) getUser,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InfoInitEvent value)? init,
    TResult Function(_InfoBlocEvent value)? getUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _InfoBlocEvent implements InfoBlocEvent {
  const factory _InfoBlocEvent({required UserData user}) = _$_InfoBlocEvent;

  UserData get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InfoBlocEventCopyWith<_InfoBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
