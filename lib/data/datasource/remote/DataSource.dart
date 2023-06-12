
import 'package:attendance/app/constance/Appconstance.dart';
import 'package:attendance/app/error/Exceptions.dart';
import 'package:attendance/app/error/arrayofmessageerror.dart';
import 'package:attendance/app/error/messageError.dart';
import 'package:attendance/app/networkInfo/internet_ckeck.dart';
import 'package:attendance/data/models/RegisterResponseModel.dart';
import 'package:attendance/domain/requests/loginrequest.dart';
import 'package:attendance/domain/requests/registerRequest.dart';
import 'package:dio/dio.dart';

abstract class BaseDataSource{
  Future<RegisterResponseModel>  register(RegisterRequest registerRequest);
  Future<RegisterResponseModel>  login(LoginRequest loginRequest);

 }


class BaseDataSourceImp extends BaseDataSource{
   final NetworkInfo networkInfo;

  BaseDataSourceImp(this.networkInfo);

  @override
  Future<RegisterResponseModel> register(RegisterRequest registerRequest)async {
    if(await networkInfo.isConnected) {
      try {
        final response =
            await Dio().post(AppConstance.REGISTERLINK, data: {
          "name": registerRequest.username,
          "email": registerRequest.email,
          "password": registerRequest.password,
        },
            options: Options(headers:
            {AppConstance.contentType:AppConstance.applicationJson}));
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.data);
          return RegisterResponseModel.fromjson(response.data);
        }


      } catch (r) {
        if(r is DioError){
          print("error from donkey");
          print(r.response!.statusCode);
          //throw ArrayOfErrorsException(ArrayOfErrors.fromJson(r.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<RegisterResponseModel> login(LoginRequest loginRequest)async {
    if(await networkInfo.isConnected){
      try {
        final response = await Dio(BaseOptions(
          receiveDataWhenStatusError: true,
        )).post(AppConstance.LOGINLINK, data: {
          "email": loginRequest.email,
          "password": loginRequest.password,
        },
            options: Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson
            }));
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("login success");
          return RegisterResponseModel.fromjson(response.data);
        }
      }catch (r) {
        if(r is DioError){
          print("error login");
          throw ServerException(ErrorModel.fromJson(r.response!.data));
        }
        // throw ServerException();
      }
    }
    throw OfflineException();
  }

}