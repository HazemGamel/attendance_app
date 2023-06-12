
import 'package:attendance/app/di.dart';
import 'package:attendance/app/networkInfo/AppPref.dart';
import 'package:attendance/domain/requests/loginrequest.dart';
import 'package:attendance/presintation/login/cubit/loginstates.dart';
import 'package:attendance/presintation/login/loginusecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this.loginUseCase) : super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  final LoginUseCase loginUseCase;
  final AppPreferences _appPreferences = instance<AppPreferences>();


  Login(String email,String password,context)async{
    emit(LoginLoadingState());
    final result = await loginUseCase.execute(
        LoginRequest(email: email, password: password));

    result.fold((left) {
      print("error login");
      showDialog(context: context, builder: (_){
        return Text(left.message);
      });
      emit(LoginErrorState(left.message));
    },(right) {
      _appPreferences.sharedPreferences.setString("token", right.token!);
      Navigator.pushReplacementNamed(context, "/homeScreen");
    emit(LoginSuccessState());
            });
  }


}