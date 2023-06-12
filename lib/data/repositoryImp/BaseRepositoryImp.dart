
import 'package:attendance/app/error/Apperrorsmessages.dart';
import 'package:attendance/app/error/Exceptions.dart';
import 'package:attendance/app/error/Failure.dart';
import 'package:attendance/data/datasource/remote/DataSource.dart';
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';
import 'package:attendance/domain/repository/BaseRepository.dart';
import 'package:attendance/domain/requests/loginrequest.dart';
import 'package:attendance/domain/requests/registerRequest.dart';
import 'package:either_dart/src/either.dart';

class BaseRepositoryImp extends BaseRepository {
  final BaseDataSource baseDataSource;

  BaseRepositoryImp(this.baseDataSource);

  @override
  Future<Either<Failure, RegisterResponseEntity>>
  register(RegisterRequest registerRequest) async {
    try {
      final result = await baseDataSource.register(registerRequest);
      return Right(result);
    } on ArrayOfErrorsException catch (failure) {
      return Left(ArrayOfErrorsFailure(AppErrorMessages.emailExist));
    } on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>>
  login(LoginRequest loginRequest) async {
    try {
      final result = await baseDataSource.login(loginRequest);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.message));
    } on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }
}