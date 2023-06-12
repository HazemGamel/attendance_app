
import 'package:attendance/app/error/Failure.dart';
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';
import 'package:attendance/domain/requests/loginrequest.dart';
import 'package:attendance/domain/requests/registerRequest.dart';
import 'package:either_dart/either.dart';

abstract class BaseRepository{
  Future<Either<Failure,RegisterResponseEntity>>
  register(RegisterRequest registerRequest);
  Future<Either<Failure,RegisterResponseEntity>>
  login(LoginRequest loginRequest);
}