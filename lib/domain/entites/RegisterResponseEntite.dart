
import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
  final UserData? user;
  final  String? token;
  const RegisterResponseEntity(this.user, this.token);
  @override
  // TODO: implement props
  List<Object?> get props => [user,token];
}

class UserData extends Equatable{
  final int? id;
  final String? name;
  final String? email;

  UserData( this.id, this.name,this.email);

  // TODO: implement props
  @override
  List<Object?> get props => [
    id,name,email
  ];
}