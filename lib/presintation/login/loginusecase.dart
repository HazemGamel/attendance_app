

import 'package:attendance/app/error/Failure.dart';
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';
import 'package:attendance/domain/repository/BaseRepository.dart';
import 'package:attendance/domain/requests/loginrequest.dart';
import 'package:either_dart/either.dart';

class LoginUseCase{
  final BaseRepository baseRepository;

  LoginUseCase(this.baseRepository);

  Future<Either<Failure,RegisterResponseEntity>>
  execute(LoginRequest loginRequest)async{
    return await baseRepository.login(loginRequest);
  }
}