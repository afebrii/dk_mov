import 'package:dk_mov/data/repositories/authentication.dart';
import 'package:dk_mov/domain/entities/result.dart';
import 'package:dk_mov/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication}) : _authentication = authentication;

  @override
  Future<Result<void>> call(void params) {
    return _authentication.logout();
  }

}