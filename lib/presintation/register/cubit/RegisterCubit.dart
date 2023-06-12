

import 'package:attendance/app/di.dart';
import 'package:attendance/app/networkInfo/AppPref.dart';
import 'package:attendance/domain/requests/registerRequest.dart';
import 'package:attendance/presintation/register/cubit/RegisterStates.dart';
import 'package:attendance/presintation/register/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(this.registerUseCase) : super(RegisterInitialState());
  final AppPreferences _appPreferences = instance<AppPreferences>();
  static RegisterCubit get(context)=>BlocProvider.of(context);
   final RegisterUseCase registerUseCase;
   Register(String name,String email,String password,context) async {
  emit(RegisterLoadingState());
  final result =  await registerUseCase.execute(
         RegisterRequest(username: name, email: email, password: password));
  result.
  fold((left) {
    print("error from back");
    emit(RegisterErrorState(left.message));
  },(right) {
    _appPreferences.sharedPreferences.setString("token", right.token!);
    Navigator.pushReplacementNamed(context, "/homeScreen");
   emit(RegisterSuccessState());
  });
   }

}

