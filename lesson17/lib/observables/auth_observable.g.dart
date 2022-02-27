// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthState on _AuthState, Store {
  final _$loggedInAtom = Atom(name: '_AuthState.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthState.signInWithGoogle');

  @override
  Future<UserCredential?> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithGoogleWebAsyncAction =
      AsyncAction('_AuthState.signInWithGoogleWeb');

  @override
  Future<UserCredential?> signInWithGoogleWeb() {
    return _$signInWithGoogleWebAsyncAction
        .run(() => super.signInWithGoogleWeb());
  }

  final _$signInAsyncAction = AsyncAction('_AuthState.signIn');

  @override
  Future<dynamic> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$signOutAsyncAction = AsyncAction('_AuthState.signOut');

  @override
  Future<bool> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$getGoogleUserAsyncAction = AsyncAction('_AuthState.getGoogleUser');

  @override
  Future getGoogleUser() {
    return _$getGoogleUserAsyncAction.run(() => super.getGoogleUser());
  }

  final _$currentUserAsyncAction = AsyncAction('_AuthState.currentUser');

  @override
  Future<UserModel> currentUser() {
    return _$currentUserAsyncAction.run(() => super.currentUser());
  }

  @override
  String toString() {
    return '''
loggedIn: ${loggedIn}
    ''';
  }
}
