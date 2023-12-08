// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app.dart' as _i8;
import '../data/data_source/main_online_data_source.dart' as _i4;
import '../data/repository/main_repositoryImpl.dart' as _i5;
import '../domain/repository/main_repository_contracts.dart' as _i3;
import '../domain/usecase/GetMainContent.dart' as _i9;
import '../ui/main_screen/main_screen.dart' as _i6;
import '../ui/main_screen/main_screen_cubit.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.MainOnlineDataSource>(() => _i4.MainOnlineDataSourceImpl());
    gh.factory<_i3.MainRepository>(() => _i5.MainRepositoryImpl(
        mainOnlineDataSource: gh<_i3.MainOnlineDataSource>()));
    gh.factory<_i6.MainScreen>(() => _i6.MainScreen(key: gh<_i7.Key>()));
    gh.factory<_i8.MyApp>(() => _i8.MyApp(key: gh<_i7.Key>()));
    gh.factory<_i9.GetMainContentUseCase>(() =>
        _i9.GetMainContentUseCase(mainRepository: gh<_i3.MainRepository>()));
    gh.factory<_i10.MainScreenCubit>(() => _i10.MainScreenCubit(
        getMainContentUseCase: gh<_i9.GetMainContentUseCase>()));
    return this;
  }
}
