// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:layer_data/layer_data.dart' as _i4;

import 'info_bloc.dart' as _i3;
import 'list_bloc.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.InfoBloc>(
      () => _i3.InfoBloc(userService: get<_i4.UserService>()));
  gh.factory<_i5.ListBloc>(
      () => _i5.ListBloc(userService: get<_i4.UserService>()));
  return get;
}
