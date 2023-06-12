
import 'package:attendance/domain/entites/RegisterResponseEntite.dart';

class UserModel extends UserData{
  UserModel({int? id, String? name, String? email})
      : super(id, name, email);

  factory UserModel.fromjson(Map<String,dynamic> json){
    return UserModel(
        id:json["ID"],
        name:json["Name"],
        email:json["Email"]
    );
  }

}