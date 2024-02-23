import 'package:flutter_game/pages/login/remote_data_source/login_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginController {
  final LoginRemoteDataSource _remoteDataSource;

  LoginController({
    required LoginRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
}
