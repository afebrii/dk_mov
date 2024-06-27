import 'package:dk_mov/data/repositories/user_repository.dart';
import 'package:dk_mov/domain/entities/result.dart';
import 'package:dk_mov/domain/entities/user.dart';
import 'package:dk_mov/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:dk_mov/domain/usecases/usecase.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository
      .uploadProfilePicture(user: params.user, imageFile: params.imageFile);
}
