

import 'package:attendance/presintation/home/cubit/homeStates.dart';
import 'package:attendance/presintation/home/mainscreen/mainScreen.dart';
import 'package:attendance/presintation/home/settingScreen/settingScreen.dart';
import 'package:attendance/presintation/home/subjectsScreen/subjectsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(InitialHomeState());

 static HomeCubit get(context)=>BlocProvider.of(context);

 int currentindex = 0;
 final List pages =[
   MainScreen(),
   SubjectsScreen(),
   SettingScreen()
 ];
 void changePage(index){
   currentindex=index;
   emit(HomeSuccessStates());
 }

}