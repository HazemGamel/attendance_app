
import 'package:attendance/app/error/Failure.dart';
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';
import 'package:attendance/domain/repository/BaseRepository.dart';
import 'package:attendance/domain/requests/registerRequest.dart';
import 'package:either_dart/either.dart';

class RegisterUseCase {
 final BaseRepository baseRepository;

  RegisterUseCase(this.baseRepository);

  Future<Either<Failure,RegisterResponseEntity>>
  execute(RegisterRequest registerRequest)async{
    return await baseRepository.register(registerRequest);
  }

}