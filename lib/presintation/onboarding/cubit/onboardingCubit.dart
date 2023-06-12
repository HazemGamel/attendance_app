
import 'package:attendance/app/di.dart';
import 'package:attendance/app/networkInfo/AppPref.dart';
import 'package:attendance/presintation/onboarding/cubit/OnboardingStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates>{
  
   final AppPreferences _appPreferences = instance<AppPreferences>();

  OnboardingCubit() : super(OnboardingInitialState());
  static OnboardingCubit get(context)=>BlocProvider.of(context);
  int currentpage = 0;

 void setPref(){
    _appPreferences.sharedPreferences.setBool("onboarding", true);
  }

  void changecurrentpage(int index){
    currentpage=index;
    emit(OnboardingSuccessState());
  }
}