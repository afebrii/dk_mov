import 'package:dk_mov/domain/usecases/login/login.dart';
import 'package:dk_mov/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:dk_mov/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
  authentication: ref.watch(authenticationProvider),
  userRepository: ref.watch(userRepositoryProvider)
);