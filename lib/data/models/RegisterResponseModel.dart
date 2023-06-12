

import 'package:attendance/data/models/userRegistermodel.dart';
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';

class RegisterResponseModel extends RegisterResponseEntity{
  const RegisterResponseModel(
      {required UserData? data, required String? token}) : super(data, token);


  factory RegisterResponseModel.fromjson(Map<String,dynamic>json)=>
      RegisterResponseModel(
          data:json["user"] !=null ? UserModel.fromjson(json["user"]):null,
          token:json["access_token"]);

}