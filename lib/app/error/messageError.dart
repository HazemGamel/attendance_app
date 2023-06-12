import 'package:equatable/equatable.dart';

class ErrorModel  extends Equatable{
  final String message;
const  ErrorModel({required this.message});

   factory ErrorModel.fromJson(Map<String,dynamic> json){
     return ErrorModel(
         message: json['msg']
     );
   }

  @override
  // TODO: implement props
  List<Object?> get props => [
    message
  ];
}