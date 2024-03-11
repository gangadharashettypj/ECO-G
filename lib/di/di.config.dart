// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:uuid/uuid.dart' as _i9;

import '../db/db.dart' as _i4;
import '../pages/app_screen/store/app_store.dart' as _i3;
import '../pages/dashboard/controller/game_controller.dart' as _i5;
import '../pages/dashboard/store/game_store.dart' as _i6;
import '../pages/home/controller/home_controller.dart' as _i7;
import 'logger_di.dart' as _i10;
import 'uuid_di.dart' as _i11;

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
  gh.lazySingleton<_i5.GameController>(() => _i5.GameController());
  gh.lazySingleton<_i6.GameStore>(() => _i6.GameStore());
  gh.lazySingleton<_i7.HomeController>(() => _i7.HomeController());
  gh.lazySingleton<_i8.Logger>(() => loggerDi.logger);
  gh.lazySingleton<_i9.Uuid>(() => uuidDi.uuid);
  return getIt;
}

class _$LoggerDi extends _i10.LoggerDi {}

class _$UuidDi extends _i11.UuidDi {}
