// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListBlocStateTearOff {
  const _$ListBlocStateTearOff();

  ListLoadingState loading() {
    return const ListLoadingState();
  }

  ListLoadedState loaded({required List<UserData> userData}) {
    return ListLoadedState(
      userData: userData,
    );
  }
}

/// @nodoc
const $ListBlocState = _$ListBlocStateTearOff();

/// @nodoc
mixin _$ListBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserData> userData) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListLoadingState value) loading,
    required TResult Function(ListLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListBlocStateCopyWith<$Res> {
  factory $ListBlocStateCopyWith(
          ListBlocState value, $Res Function(ListBlocState) then) =
      _$ListBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ListBlocStateCopyWithImpl<$Res>
    implements $ListBlocStateCopyWith<$Res> {
  _$ListBlocStateCopyWithImpl(this._value, this._then);

  final ListBlocState _value;
  // ignore: unused_field
  final $Res Function(ListBlocState) _then;
}

/// @nodoc
abstract class $ListLoadingStateCopyWith<$Res> {
  factory $ListLoadingStateCopyWith(
          ListLoadingState value, $Res Function(ListLoadingState) then) =
      _$ListLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ListLoadingStateCopyWithImpl<$Res>
    extends _$ListBlocStateCopyWithImpl<$Res>
    implements $ListLoadingStateCopyWith<$Res> {
  _$ListLoadingStateCopyWithImpl(
      ListLoadingState _value, $Res Function(ListLoadingState) _then)
      : super(_value, (v) => _then(v as ListLoadingState));

  @override
  ListLoadingState get _value => super._value as ListLoadingState;
}

/// @nodoc

class _$ListLoadingState implements ListLoadingState {
  const _$ListLoadingState();

  @override
  String toString() {
    return 'ListBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ListLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserData> userData) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
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
    required TResult Function(ListLoadingState value) loading,
    required TResult Function(ListLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListLoadingState implements ListBlocState {
  const factory ListLoadingState() = _$ListLoadingState;
}

/// @nodoc
abstract class $ListLoadedStateCopyWith<$Res> {
  factory $ListLoadedStateCopyWith(
          ListLoadedState value, $Res Function(ListLoadedState) then) =
      _$ListLoadedStateCopyWithImpl<$Res>;
  $Res call({List<UserData> userData});
}

/// @nodoc
class _$ListLoadedStateCopyWithImpl<$Res>
    extends _$ListBlocStateCopyWithImpl<$Res>
    implements $ListLoadedStateCopyWith<$Res> {
  _$ListLoadedStateCopyWithImpl(
      ListLoadedState _value, $Res Function(ListLoadedState) _then)
      : super(_value, (v) => _then(v as ListLoadedState));

  @override
  ListLoadedState get _value => super._value as ListLoadedState;

  @override
  $Res call({
    Object? userData = freezed,
  }) {
    return _then(ListLoadedState(
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ));
  }
}

/// @nodoc

class _$ListLoadedState implements ListLoadedState {
  const _$ListLoadedState({required this.userData});

  @override
  final List<UserData> userData;

  @override
  String toString() {
    return 'ListBlocState.loaded(userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ListLoadedState &&
            (identical(other.userData, userData) ||
                const DeepCollectionEquality()
                    .equals(other.userData, userData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userData);

  @JsonKey(ignore: true)
  @override
  $ListLoadedStateCopyWith<ListLoadedState> get copyWith =>
      _$ListLoadedStateCopyWithImpl<ListLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserData> userData) loaded,
  }) {
    return loaded(userData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
  }) {
    return loaded?.call(userData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserData> userData)? loaded,
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
    required TResult Function(ListLoadingState value) loading,
    required TResult Function(ListLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListLoadingState value)? loading,
    TResult Function(ListLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ListLoadedState implements ListBlocState {
  const factory ListLoadedState({required List<UserData> userData}) =
      _$ListLoadedState;

  List<UserData> get userData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListLoadedStateCopyWith<ListLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ListBlocEventTearOff {
  const _$ListBlocEventTearOff();

  _ListInitEvent init() {
    return const _ListInitEvent();
  }
}

/// @nodoc
const $ListBlocEvent = _$ListBlocEventTearOff();

/// @nodoc
mixin _$ListBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListInitEvent value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListInitEvent value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListInitEvent value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListBlocEventCopyWith<$Res> {
  factory $ListBlocEventCopyWith(
          ListBlocEvent value, $Res Function(ListBlocEvent) then) =
      _$ListBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ListBlocEventCopyWithImpl<$Res>
    implements $ListBlocEventCopyWith<$Res> {
  _$ListBlocEventCopyWithImpl(this._value, this._then);

  final ListBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ListBlocEvent) _then;
}

/// @nodoc
abstract class _$ListInitEventCopyWith<$Res> {
  factory _$ListInitEventCopyWith(
          _ListInitEvent value, $Res Function(_ListInitEvent) then) =
      __$ListInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$ListInitEventCopyWithImpl<$Res>
    extends _$ListBlocEventCopyWithImpl<$Res>
    implements _$ListInitEventCopyWith<$Res> {
  __$ListInitEventCopyWithImpl(
      _ListInitEvent _value, $Res Function(_ListInitEvent) _then)
      : super(_value, (v) => _then(v as _ListInitEvent));

  @override
  _ListInitEvent get _value => super._value as _ListInitEvent;
}

/// @nodoc

class _$_ListInitEvent implements _ListInitEvent {
  const _$_ListInitEvent();

  @override
  String toString() {
    return 'ListBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ListInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
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
    required TResult Function(_ListInitEvent value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListInitEvent value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListInitEvent value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _ListInitEvent implements ListBlocEvent {
  const factory _ListInitEvent() = _$_ListInitEvent;
}
