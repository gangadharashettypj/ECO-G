// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:uuid/uuid.dart' as _i10;

import '../db/db.dart' as _i4;
import '../pages/app_screen/store/app_store.dart' as _i3;
import '../pages/dashboard/controller/home_controller.dart' as _i5;
import '../pages/dashboard/store/home_store.dart' as _i6;
import '../pages/login/controller/login_controller.dart' as _i11;
import '../pages/login/remote_data_source/login_remote_data_source.dart' as _i8;
import '../services/notification/notification.dart' as _i9;
import 'logger_di.dart' as _i12;
import 'uuid_di.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final loggerDi = _$LoggerDi();
  final uuidDi = _$UuidDi();
  gh.lazySingleton<_i3.AppStore>(() => _i3.AppStore());
  gh.lazySingleton<_i4.DB>(() => _i4.DB());
  gh.lazySingleton<_i5.HomeController>(() => _i5.HomeController());
  gh.lazySingleton<_i6.HomeStore>(() => _i6.HomeStore());
  gh.lazySingleton<_i7.Logger>(() => loggerDi.logger);
  gh.lazySingleton<_i8.LoginRemoteDataSource>(
      () => _i8.LoginRemoteDataSource());
  gh.lazySingleton<_i9.NotificationService>(() => _i9.NotificationService());
  gh.lazySingleton<_i10.Uuid>(() => uuidDi.uuid);
  gh.lazySingleton<_i11.LoginController>(() =>
      _i11.LoginController(remoteDataSource: gh<_i8.LoginRemoteDataSource>()));
  return getIt;
}

class _$LoggerDi extends _i12.LoggerDi {}

class _$UuidDi extends _i13.UuidDi {}
